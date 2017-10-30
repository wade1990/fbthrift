#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t, uint32_t
from cython.operator cimport dereference as deref, preincrement as inc
import thrift.py3.types
cimport thrift.py3.types
cimport thrift.py3.exceptions
from thrift.py3.types import NOTSET
from thrift.py3.types cimport translate_cpp_enum_to_python
cimport thrift.py3.std_libcpp as std_libcpp
from thrift.py3.serializer cimport IOBuf
from thrift.py3.serializer import Protocol
cimport thrift.py3.serializer as serializer
from thrift.py3.serializer import deserialize, serialize

import sys
import itertools
from collections.abc import Sequence, Set, Mapping, Iterable
from enum import Enum
import warnings




cdef cHsFoo _HsFoo_defaults = cHsFoo()

cdef class HsFoo(thrift.py3.types.Struct):

    def __init__(
        HsFoo self,
        MyInt=None
    ):
        self._cpp_obj = move(HsFoo._make_instance(
          NULL,
          MyInt,
        ))

    def __call__(
        HsFoo self,
        MyInt=NOTSET
    ):
        changes = any((
            MyInt is not NOTSET,
        ))

        if not changes:
            return self

        inst = <HsFoo>HsFoo.__new__(HsFoo)
        inst._cpp_obj = move(HsFoo._make_instance(
          self._cpp_obj.get(),
          MyInt,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cHsFoo] _make_instance(
        cHsFoo* base_instance,
        object MyInt
    ) except *:
        cdef unique_ptr[cHsFoo] c_inst
        if base_instance:
            c_inst = make_unique[cHsFoo](deref(base_instance))
        else:
            c_inst = make_unique[cHsFoo]()

        if base_instance:
            # Convert None's to default value.
            if MyInt is None:
                deref(c_inst).MyInt = _HsFoo_defaults.MyInt
                deref(c_inst).__isset.MyInt = False
            elif MyInt is NOTSET:
                MyInt = None

        if MyInt is not None:
            deref(c_inst).MyInt = MyInt
            deref(c_inst).__isset.MyInt = True

        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'MyInt', self.MyInt

    def __bool__(self):
        return deref(self._cpp_obj).__isset.MyInt

    @staticmethod
    cdef create(shared_ptr[cHsFoo] cpp_obj):
        inst = <HsFoo>HsFoo.__new__(HsFoo)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def MyInt(self):
        if not deref(self._cpp_obj).__isset.MyInt:
            return None

        return self._cpp_obj.get().MyInt


    def __hash__(HsFoo self):
        if not self.__hash:
            self.__hash = hash((
            self.MyInt,
            ))
        return self.__hash

    def __repr__(HsFoo self):
        return f'HsFoo(MyInt={repr(self.MyInt)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, HsFoo) and
                isinstance(other, HsFoo)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cHsFoo cself = deref((<HsFoo>self)._cpp_obj)
        cdef cHsFoo cother = deref((<HsFoo>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(HsFoo self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cHsFoo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cHsFoo](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cHsFoo](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(HsFoo self, const IOBuf* buf, proto):
        cdef uint32_t needed
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cHsFoo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cHsFoo](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cHsFoo](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (HsFoo, serialize(self)))


