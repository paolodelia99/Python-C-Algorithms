from __future__ import absolute_import

from Cython.Distutils import build_ext
from Cython.Build import cythonize
from distutils.core import Extension
from distutils.core import setup

import glob

VERSION = open('VERSION').read().strip()

# Sources & libraries
inc_dirs = []
lib_dirs = []
libs = []
sources = []

inc_dirs += ['c_alg/src']
sources += glob.glob("cy_alg/*.pyx")
sources += glob.glob("c_alg/src/*.c")

impl_data_structure = ["queue", "trie"]


def extensions_generator():
    """
    :return return a list containing all the extension of the implemented data structures
    """
    extensions = []

    for ds in impl_data_structure:
        ds_source = glob.glob("cy_alg/{}.pyx".format(ds))
        ds_source += glob.glob("c_alg/src/{}.c".format(ds))
        extension = Extension(
            ds,
            sources=ds_source,
            include_dirs=inc_dirs,
            library_dirs=lib_dirs,
            libraries=libs,
        )
        extensions.append(extension)

    return extensions


setup(
    name="c algorithms in cython",
    author="Paolo D\'Elia",
    author_email="paolo.delia99@gmail.com",
    version=VERSION,
    description='Let c-algorithms project be imported in cython',
    long_description="""\
    """,
    # url='',
    license='http://www.opensource.org/licenses/bsd-license.php',
    cmdclass={'build_ext': build_ext},
    ext_modules=cythonize(extensions_generator()),
    packages=['cy_alg'],
)
