import os

DIR_OF_THIS_SCRIPT = os.path.dirname(__file__)

def Settings( **kwargs ):
    ret = {}
    if os.path.exists(os.path.join(DIR_OF_THIS_SCRIPT, '.venv')):
        ret['interpreter_path'] = os.path.join(DIR_OF_THIS_SCRIPT, '.venv', 'bin', 'python')
    return ret

def PythonSysPath(**kwargs):
    sys_path = kwargs['sys_path']
    if os.getenv('PYTHONPATH', None):
        sys_path.insert(0, os.getenv('PYTHONPATH'))
    return sys_path

