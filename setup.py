from __future__ import absolute_import

from Cython.Distutils import build_ext
from Cython.Build import cythonize
from distutils.core import setup

from tools.ext_generator import extensions_generator


VERSION = open('VERSION').read().strip()


setup(
    name="c algorithms in cython",
    author="Paolo D\'Elia",
    author_email="paolo.delia99@gmail.com",
    version=VERSION,
    license="MIT",
    description='Let c-algorithms project be imported in cython',
    long_description="""\
    """,
    url='https://github.com/paolodelia99/Python-C-Algorithms',
    cmdclass={'build_ext': build_ext},
    ext_modules=cythonize(extensions_generator()),
    packages=['cy_alg'], requires=['Cython']
)
