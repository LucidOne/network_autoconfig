# -*- coding: utf-8 -*-

import os
import catkin_pkg.package

#import sys
#sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    'sphinx.ext.viewcode',
]

catkin_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) 
catkin_package = catkin_pkg.package.parse_package(os.path.join(catkin_dir, catkin_pkg.package.PACKAGE_MANIFEST_FILENAME))

source_suffix = '.rst'
master_doc = 'index'

project = u'network_autoconfig'
copyright = u'2019, HXR'

version = catkin_package.version
release = catkin_package.version

html_theme = 'classic'
htmlhelp_basename = 'network_autoconfig'
