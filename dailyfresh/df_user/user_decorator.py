from django.http import HttpResponseRedirect


def is_login(func):
    def login(request, *args, **kwargs):
        if  request.session.get('user_id'):
            return func(request, *args, **kwargs)
        else:
            redirect = HttpResponseRedirect('/user/login')
            path = request.get_full_path()
            redirect.set_cookie('url', request.get_full_path())
            return redirect
    return login