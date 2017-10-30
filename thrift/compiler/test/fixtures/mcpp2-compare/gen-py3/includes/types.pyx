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


class AnEnum(Enum):
    FIELDA = <int> (AnEnum__FIELDA)
    FIELDB = <int> (AnEnum__FIELDB)

    __hash__ = Enum.__hash__

    def __eq__(self, other):
        if not isinstance(other, self.__class__):
            warnings.warn(f"comparison not supported between instances of {type(self)} and {type(other)}", RuntimeWarning, stacklevel=2)
            return False
        return self.value == other.value


cdef cAnEnum AnEnum_to_cpp(value):
    if value == AnEnum.FIELDA:
        return AnEnum__FIELDA
    elif value == AnEnum.FIELDB:
        return AnEnum__FIELDB


cdef cAStruct _AStruct_defaults = cAStruct()

cdef class AStruct(thrift.py3.types.Struct):

    def __init__(
        AStruct self,
        FieldA=None
    ):
        self._cpp_obj = move(AStruct._make_instance(
          NULL,
          FieldA,
        ))

    def __call__(
        AStruct self,
        FieldA=NOTSET
    ):
        changes = any((
            FieldA is not NOTSET,
        ))

        if not changes:
            return self

        inst = <AStruct>AStruct.__new__(AStruct)
        inst._cpp_obj = move(AStruct._make_instance(
          self._cpp_obj.get(),
          FieldA,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cAStruct] _make_instance(
        cAStruct* base_instance,
        object FieldA
    ) except *:
        cdef unique_ptr[cAStruct] c_inst
        if base_instance:
            c_inst = make_unique[cAStruct](deref(base_instance))
        else:
            c_inst = make_unique[cAStruct]()

        if base_instance:
            # Convert None's to default value.
            if FieldA is None:
                deref(c_inst).FieldA = _AStruct_defaults.FieldA
                deref(c_inst).__isset.FieldA = False
            elif FieldA is NOTSET:
                FieldA = None

        if FieldA is not None:
            deref(c_inst).FieldA = FieldA
            deref(c_inst).__isset.FieldA = True

        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'FieldA', self.FieldA

    def __bool__(self):
        return deref(self._cpp_obj).__isset.FieldA

    @staticmethod
    cdef create(shared_ptr[cAStruct] cpp_obj):
        inst = <AStruct>AStruct.__new__(AStruct)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def FieldA(self):
        if not deref(self._cpp_obj).__isset.FieldA:
            return None

        return self._cpp_obj.get().FieldA


    def __hash__(AStruct self):
        if not self.__hash:
            self.__hash = hash((
            self.FieldA,
            ))
        return self.__hash

    def __repr__(AStruct self):
        return f'AStruct(FieldA={repr(self.FieldA)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, AStruct) and
                isinstance(other, AStruct)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cAStruct cself = deref((<AStruct>self)._cpp_obj)
        cdef cAStruct cother = deref((<AStruct>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(AStruct self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cAStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cAStruct](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cAStruct](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(AStruct self, const IOBuf* buf, proto):
        cdef uint32_t needed
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cAStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cAStruct](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cAStruct](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (AStruct, serialize(self)))


cdef cAStructB _AStructB_defaults = cAStructB()

cdef class AStructB(thrift.py3.types.Struct):

    def __init__(
        AStructB self,
        FieldA=None
    ):
        self._cpp_obj = move(AStructB._make_instance(
          NULL,
          FieldA,
        ))

    def __call__(
        AStructB self,
        FieldA=NOTSET
    ):
        changes = any((
            FieldA is not NOTSET,
        ))

        if not changes:
            return self

        inst = <AStructB>AStructB.__new__(AStructB)
        inst._cpp_obj = move(AStructB._make_instance(
          self._cpp_obj.get(),
          FieldA,
        ))
        return inst

    @staticmethod
    cdef unique_ptr[cAStructB] _make_instance(
        cAStructB* base_instance,
        object FieldA
    ) except *:
        cdef unique_ptr[cAStructB] c_inst
        if base_instance:
            c_inst = make_unique[cAStructB](deref(base_instance))
        else:
            c_inst = make_unique[cAStructB]()

        if base_instance:
            # Convert None's to default value.
            if FieldA is None:
                raise ValueError("Reference-annotated fields may not be initialized to defaults")
            elif FieldA is NOTSET:
                FieldA = None

        if FieldA is not None:
            deref(c_inst).FieldA = const_pointer_cast((<AStruct?>FieldA)._cpp_obj)
        # in C++ you don't have to call move(), but this doesn't translate
        # into a C++ return statement, so you do here
        return move_unique(c_inst)

    def __iter__(self):
        yield 'FieldA', self.FieldA

    def __bool__(self):
        return <bint>(deref(self._cpp_obj).FieldA)

    @staticmethod
    cdef create(shared_ptr[cAStructB] cpp_obj):
        inst = <AStructB>AStructB.__new__(AStructB)
        inst._cpp_obj = cpp_obj
        return inst

    @property
    def FieldA(self):
        if self.__FieldA is None:
            if not deref(self._cpp_obj).FieldA:
                return None
            self.__FieldA = AStruct.create(aliasing_constructor_FieldA(self._cpp_obj, <cAStruct*>(deref(self._cpp_obj).FieldA.get())))
        return self.__FieldA


    def __hash__(AStructB self):
        if not self.__hash:
            self.__hash = hash((
            self.FieldA,
            ))
        return self.__hash

    def __repr__(AStructB self):
        return f'AStructB(FieldA={repr(self.FieldA)})'
    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, AStructB) and
                isinstance(other, AStructB)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cAStructB cself = deref((<AStructB>self)._cpp_obj)
        cdef cAStructB cother = deref((<AStructB>other)._cpp_obj)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    cdef bytes _serialize(AStructB self, proto):
        cdef string c_str
        if proto is Protocol.COMPACT:
            serializer.CompactSerialize[cAStructB](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.BINARY:
            serializer.BinarySerialize[cAStructB](deref(self._cpp_obj.get()), &c_str)
        elif proto is Protocol.JSON:
            serializer.JSONSerialize[cAStructB](deref(self._cpp_obj.get()), &c_str)
        return <bytes> c_str

    cdef uint32_t _deserialize(AStructB self, const IOBuf* buf, proto):
        cdef uint32_t needed
        if proto is Protocol.COMPACT:
            needed = serializer.CompactDeserialize[cAStructB](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.BINARY:
            needed = serializer.BinaryDeserialize[cAStructB](buf, deref(self._cpp_obj.get()))
        elif proto is Protocol.JSON:
            needed = serializer.JSONDeserialize[cAStructB](buf, deref(self._cpp_obj.get()))
        return needed

    def __reduce__(self):
        return (deserialize, (AStructB, serialize(self)))


IncludedConstant = 42
IncludedInt64 = int
