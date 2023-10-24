from django.shortcuts import render, redirect
import markdown2
from . import util
from django import forms 
from django.contrib import messages



class Searchform(forms.Form):
    title = forms.CharField( label='search')
    


def index(request):
    if request.method == 'POST':
        form = Searchform(request.POST)
        if form.is_valid():
            title = form.cleaned_data['title'] 
            return redirect('entry', title=title)
        else: form = Searchform()
   


    return render(request, "encyclopedia/index.html", {
        "entries":util.list_entries(),
        'form': Searchform(),
        
        
     })



def entry(request,title):
    linkEdit = f'<a href="edit/{title}">Edit the page</a>'
    Mdcontent = util.get_entry(title)
    if Mdcontent is None:
        return render(request, "encyclopedia/error.html")

    else:
        HtmlContent = markdown2.markdown(Mdcontent)
        return render(request, "encyclopedia/wiki/entry.html",{
        "name":title,
        "HtmlContent":HtmlContent,
        "linkEdit":linkEdit
    })


class NewPageForm(forms.Form):
    title = forms.CharField( label='title')
    content = forms.CharField( label='content')

    
def NewPage(request):
    
    if request.method =='POST':
        form = NewPageForm(request.POST)
        if form.is_valid():
            title = form.cleaned_data['title']
            content = form.cleaned_data['content']
            entry_names = util.list_entries()
            if title in entry_names:
                messages.error(request, f'La página "{title}" ya existe. Elige un título diferente.')
            else:
                util.save_entry(title,content)
                messages.success(request, f'La página "{title}" Se guardo correctamente.')
                form = NewPageForm()
                    
             
            
     
        

    return render(request,"encyclopedia/create-page.html",{
        "messages":messages.get_messages(request),
        'form': NewPageForm(),
        "entries":util.list_entries()
        
    })
        
  
def EditEntry(request,title):
        Mdcontent = util.get_entry(title)
        form = NewPageForm( initial={'content': Mdcontent, 'title':title})
        form.fields['title'].widget.attrs['readonly'] = 'readonly'
        if request.method =='POST':
            if form.is_valid():
                title = form.cleaned_data['title']
                content = form.cleaned_data['content']
                util.save_entry(title,content)
               
                form = NewPageForm()
                
        return render(request,"encyclopedia/wiki/edit/Entry.html",{
        "form": form
        })

    # HACIENDO QUE FUNCIONE LA PAGINA PARA EDITAR ENTRTy TEXT AREA
