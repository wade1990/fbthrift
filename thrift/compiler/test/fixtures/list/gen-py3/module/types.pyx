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




cdef class List__string:
    def __init__(self, items=None):
        if isinstance(items, List__string):
            self._cpp_obj = (<List__string> items)._cpp_obj
        else:
            self._cpp_obj = move(List__string._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[vector[string]] c_items):
        inst = <List__string>List__string.__new__(List__string)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[vector[string]] _make_instance(object items) except *:
        cdef unique_ptr[vector[string]] c_inst = make_unique[vector[string]]()
        if items:
            for item in items:
                deref(c_inst).push_back(item.encode('UTF-8'))
        return move_unique(c_inst)

    def __add__(object self, object other):
        return type(self)(itertools.chain(self, other))

    def __getitem__(self, object index_obj):
        cdef shared_ptr[vector[string]] c_inst
        cdef string citem
        if isinstance(index_obj, slice):
            c_inst = make_shared[vector[string]]()
            start_val = index_obj.start
            stop_val = index_obj.stop
            step_val = index_obj.step
            sz = deref(self._cpp_obj).size()

            if step_val == 0 or step_val is None:
                step_val = 1
            if step_val > 0:
                if start_val is None:
                    start_val = 0
                elif start_val > sz:
                    start_val = sz
                if stop_val is None:
                    stop_val = sz
                elif stop_val > sz:
                    stop_val = sz
            else:
                if start_val is None:
                    start_val = sz - 1
                elif start_val > sz - 1:
                    start_val = sz - 1
                if stop_val is None:
                    stop_val = -1
                elif stop_val > sz - 1:
                    stop_val = sz - 1

            index = start_val
            while ((step_val > 0 and index < stop_val) or
                   (step_val < 0 and index > stop_val)):
                citem = deref(self._cpp_obj.get())[index]
                deref(c_inst).push_back(citem)
                index += step_val
            return List__string.create(c_inst)
        else:
            index = <int?>index_obj
            size = len(self)
            # Convert a negative index
            if index < 0:
                index = size + index
            if index >= size or index < 0:
                raise IndexError('list index out of range')
            citem = deref(self._cpp_obj.get())[index]
            return bytes(citem).decode('UTF-8')

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self))
        return self.__hash

    def __contains__(self, item):
        if not self:
            return False
        cdef string citem = item.encode('UTF-8')
        cdef vector[string] vec = deref(
            self._cpp_obj.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef string citem
        for citem in deref(self._cpp_obj):
            yield bytes(citem).decode('UTF-8')

    def __repr__(self):
        if not self:
            return 'i[]'
        return f'i[{", ".join(map(repr, self))}]'

    def __reversed__(self):
        if not self:
            raise StopIteration
        cdef string citem
        cdef vector[string] vec = deref(
            self._cpp_obj.get())
        cdef vector[string].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield bytes(citem).decode('UTF-8')
            inc(loc)

    def index(self, item):
        if not self:
            raise ValueError(f'{item} is not in list')
        cdef string citem = item.encode('UTF-8')
        cdef vector[string] vec = deref(self._cpp_obj.get())
        cdef vector[string].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError(f'{item} is not in list')

    def count(self, item):
        if not self:
            return 0
        cdef string citem = item.encode('UTF-8')
        cdef vector[string] vec = deref(self._cpp_obj.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__string)

cdef class Map__i64_List__string:
    def __init__(self, items=None):
        if isinstance(items, Map__i64_List__string):
            self._cpp_obj = (<Map__i64_List__string> items)._cpp_obj
        else:
            self._cpp_obj = move(Map__i64_List__string._make_instance(items))

    @staticmethod
    cdef create(shared_ptr[cmap[int64_t,vector[string]]] c_items):
        inst = <Map__i64_List__string>Map__i64_List__string.__new__(Map__i64_List__string)
        inst._cpp_obj = c_items
        return inst

    @staticmethod
    cdef unique_ptr[cmap[int64_t,vector[string]]] _make_instance(object items) except *:
        cdef unique_ptr[cmap[int64_t,vector[string]]] c_inst = make_unique[cmap[int64_t,vector[string]]]()
        if items:
            for key, item in items.items():
                deref(c_inst).insert(cpair[int64_t,vector[string]](key,vector[string](deref(List__string(item)._cpp_obj.get()))))
        return move_unique(c_inst)

    def __getitem__(self, key):
        if not self:
            raise KeyError(f'{key}')
        cdef int64_t ckey = key
        cdef cmap[int64_t,vector[string]].iterator iter = deref(
            self._cpp_obj).find(ckey)
        if iter == deref(self._cpp_obj).end():
            raise KeyError(f'{key}')
        cdef vector[string] citem = deref(iter).second
        return List__string.create(
    make_shared[vector[string]](citem))

    def __len__(self):
        return deref(self._cpp_obj).size()

    def __iter__(self):
        if not self:
            raise StopIteration
        cdef int64_t citem
        for pair in deref(self._cpp_obj):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        if not self.__hash:
            self.__hash = hash(tuple(self.items()))
        return self.__hash

    def __repr__(self):
        if not self:
            return 'i{}'
        return f'i{{{", ".join(map(lambda i: f"{repr(i[0])}: {repr(i[1])}", self.items()))}}}'



    def __contains__(self, key):
        cdef int64_t ckey = key
        return deref(self._cpp_obj).count(ckey) > 0

    def get(self, key, default=None):
        if not self:
            return default
        cdef int64_t ckey = key
        cdef cmap[int64_t,vector[string]].iterator iter = \
            deref(self._cpp_obj).find(ckey)
        if iter == deref(self._cpp_obj).end():
            return default
        cdef vector[string] citem = deref(iter).second
        return List__string.create(
    make_shared[vector[string]](citem))

    def keys(self):
        return self.__iter__()

    def values(self):
        if not self:
            raise StopIteration
        cdef vector[string] citem
        for pair in deref(self._cpp_obj):
            citem = pair.second
            yield List__string.create(
    make_shared[vector[string]](citem))

    def items(self):
        if not self:
            raise StopIteration
        cdef int64_t ckey
        cdef vector[string] citem
        for pair in deref(self._cpp_obj):
            ckey = pair.first
            citem = pair.second

            yield (ckey, List__string.create(
    make_shared[vector[string]](citem)))



Mapping.register(Map__i64_List__string)

TEST_MAP = Map__i64_List__string.create(make_shared[cmap[int64_t,vector[string]]](cTEST_MAP()))
