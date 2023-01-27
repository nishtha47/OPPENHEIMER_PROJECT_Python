import requests
def upload_file(endpoint_url,user_name,file_name,file_path, seperator,file_type):
    url = endpoint_url
    payload = {'username': user_name, 'delimiter': seperator}
    files = {'files': (file_name, open(file_path, 'rb'), file_type, {'Expires': '0'})}
    r = requests.post(url, files=files, data=payload)
    return r.text