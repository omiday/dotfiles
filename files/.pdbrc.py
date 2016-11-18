import sys
import os

#print ".pdbrc.py started"

#
# https://wiki.python.org/moin/PdbRcIdea
#

# return to debugger after fatal exception (Python cookbook 14.5):
def info(type, value, tb):
    if hasattr(sys, 'ps1') or not sys.stderr.isatty():
        sys.__excepthook__(type, value, tb)
    import traceback, pdb
    traceback.print_exception(type, value, tb)
    print
    pdb.pm()

sys.excepthook = info

# From (on my machine) /usr/local/lib/python2.3/less user.py:
import os
home = os.curdir                        # Default
if 'HOME' in os.environ:
    home = os.environ['HOME']
elif os.name == 'posix':
    home = os.path.expanduser("~/")
# Make sure home always ends with a directory separator:
home = os.path.realpath(home) + os.sep

# Try to execute local file (if any) unless we are in the home dir.
if home != os.path.realpath(os.curdir) + os.sep:
    # Avoid recursively loading this file.
    try:
        _already_loaded += 1
    except NameError:
        _already_loaded = 1
    if _already_loaded < 3:
        try:
            execfile("pdbrc.py")
        except IOError:
            pass

# Command line history:
import readline
histfile = os.path.join(home, '.pdb_history')
histlength = 100000
try:
    readline.read_history_file(histfile)
except IOError:
    pass
import atexit
atexit.register(readline.write_history_file, histfile)
del histfile
readline.set_history_length(histlength)

# Cleanup any variables that could otherwise clutter up the namespace.
try:
    del atexit
    del home
    del info
    del os
    del pdb
    del readline
    del rlcompleter
    # careful here:
    del _already_loaded
except NameError:
    # Probably this is a second pdbrc that has been loaded.
    pass


#
# https://code.activestate.com/recipes/498182/
#

# save this in .pdbrc.py in your home directory
def complete(self, text, state):
    """return the next possible completion for text, using the current frame's
       local namespace

       This is called successively with state == 0, 1, 2, ... until it
       returns None.  The completion should begin with 'text'.
    """
    # keep a completer class, and make sure that it uses the current local scope 
    if not hasattr(self, 'completer'):
        self.completer = rlcompleter.Completer(self.curframe.f_locals)
    else:
        self.completer.namespace = self.curframe.f_locals
    return self.completer.complete(text, state) 

#print ".pdbrc.py finished"
