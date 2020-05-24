"""
This file produce the extension needed to setup.py
"""
from distutils.core import Extension
from .Data_Structure_Extention import DataStructureExtention
import glob

# Sources & libraries
inc_dirs = []
lib_dirs = []
libs = []
sources = []

inc_dirs += ['c_alg/src']
sources += glob.glob("cy_alg/*.pyx")
sources += glob.glob("c_alg/src/*.c")

impl_data_structure = [DataStructureExtention("queue", "queue"), DataStructureExtention("trie", "trie"),
                       DataStructureExtention("hash_table", "hash-table",
                                              ["c_alg/src/compare-string.c", "c_alg/src/hash-string.c"])]


def extensions_generator():
    """
    @return return a list containing all the extension of the implemented data structures
    """
    extensions = []

    for dse in impl_data_structure:
        ds_source = glob.glob("cy_alg/{}.pyx".format(dse.py_name))
        ds_source += glob.glob("c_alg/src/{}.c".format(dse.c_name))

        if dse.other_src:
            for src in dse.other_src:
                ds_source += glob.glob(src)

        extension = Extension(
            dse.py_name,
            sources=ds_source,
            include_dirs=inc_dirs,
            library_dirs=lib_dirs,
            libraries=libs,
        )
        extensions.append(extension)

    return extensions
