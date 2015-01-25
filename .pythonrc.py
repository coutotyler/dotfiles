tylerDebug = 0
if tylerDebug: import pdb

try: import sys
except ImportError: print "Module sys not available."
try: import re
except ImportError: print "Module re not available." 
try: import inspect
except ImportError: print "Module inspect not available" 

if not re.search('ipython$',sys.argv[0]):
	try: import readline
	except ImportError: print "Module readline not available."
	else:
		try: import rlcompleter
		except ImportError: print "Module rlcompleter not available."
		else: readline.parse_and_bind("tab: complete")

def getdef(function, withDoc=False): 
	attr = inspect.getargspec(function)
	defstring = function.__name__+'('
	if attr.defaults is None:
		diff = len(attr.args)
	else: 
		diff = len(attr.args) - len(attr.defaults)
	for i,arg in enumerate(attr.args):
		try:
			if i - diff < 0:	#@ ...then the argument doesn't have a default 
				defstring += arg+', '
			elif arg is not attr.args[-1]:
				defstring += arg+'='+str(attr.defaults[i-diff])+', '
			else:
				defstring += arg+'='+str(attr.defaults[i-diff])
		except IndexError: pass
	defstring += ')'
	print defstring
	if withDoc: print function.__doc__
