/*
 * Copyright 2016-present Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <fatal/type/cat.h>
#include <folly/Traits.h>
#include <thrift/lib/cpp2/reflection/container_traits.h>
#include <thrift/lib/cpp2/reflection/reflection.h>
#include <thrift/lib/thrift/gen-cpp2/reflection_types.h>

/**
 * READ ME FIRST: this header backports static reflection metatypes to legacy
 * reflection metadata for Thrift types.
 *
 * Please refer to the top of `thrift/lib/cpp2/reflection/reflection.h` on how
 * to enable compile-time reflection for Thrift types. The present header relies
 * on it for its functionality.
 *
 * TROUBLESHOOTING:
 *  - make sure you've followed the instructions on `reflection.h` to enable
 *    generation of compile-time reflection;
 *  - make sure you've included the metadata for your Thrift types, as specified
 *    in `reflection.h`.
 */

#include <thrift/lib/cpp2/reflection/internal/legacy_reflection-inl-pre.h>

namespace apache {
namespace thrift {

using legacy_reflection_id_t = std::uint64_t;
using legacy_reflection_schema_t = reflection::Schema;

/***
 *  Provides access to the legacy reflection utilities for a Thrift type `T`.
 *
 *  See the individual member methods for more information.
 */
template <typename T>
struct legacy_reflection {
  /***
   *  Registers legacy metadata about Thrift type `T`, and all Thrift types
   *  transitively used by `T`, into `schema` using Thrift's static reflection
   *  support.
   *
   *  Mimics the behavior of `T::_reflection_register` generated by Thrift 1.
   *
   *  NOTE: look at the top of this file for instructions on how to enable
   *  reflection support.
   *
   *  Usage example:
   *
   *    //  MyModule.thrift
   *    struct MyStruct {
   *      1: string data,
   *    }
   *
   *    //  C++
   *    apache::thrift::reflection::Schema schema;
   *    apache::thrift::legacy_reflection<MyStruct>::register_into(schema);
   *    for (const auto& kvp : schema.names) {
   *      const auto& rname = kvp.first;
   *      const auto rid = kvp.second;
   *      const auto& datatype = schema.dataTypes[rid];
   *      LOG(INFO) << datatype.name;
   *    }
   *    //  Writes two unordered log lines:
   *    //    struct MyModule.MyStruct
   *    //    string
   *
   *  WARNING: This function uses a hash function implemented by OpenSSL; which
   *  is not thread-safe until OpenSSL is initialized.
   */
  static void register_into(legacy_reflection_schema_t& schema);

  /***
   *  Returns legacy metadata about Thrift type `T`, and all Thrift types
   *  transitively used by `T`, in a schema using Thrift's static reflection
   *  support.
   *
   *  Mimics the behavior of `T::_reflection_register` generated by Thrift 1.
   *
   *  NOTE: look at the top of this file for instructions on how to enable
   *  reflection support.
   *
   *  Usage example:
   *
   *    //  MyModule.thrift
   *    struct MyStruct {
   *      1: string data,
   *    }
   *
   *    //  C++
   *    auto schema = apache::thrift::legacy_reflection<MyStruct>::schema();
   *    for (const auto& kvp : schema.names) {
   *      const auto& rname = kvp.first;
   *      const auto rid = kvp.second;
   *      const auto& datatype = schema.dataTypes[rid];
   *      LOG(INFO) << datatype.name;
   *    }
   *    //  Writes two unordered log lines:
   *    //    struct MyModule.MyStruct
   *    //    string
   *
   *  WARNING: This function uses a hash function implemented by OpenSSL; which
   *  is not thread-safe until OpenSSL is initialized.
   */
  static legacy_reflection_schema_t schema();

  /***
   *  Returns the legacy reflection name of a Thrift type `T` using Thrift's
   *  static reflection support.
   *
   *  Mimics the strings created by the behavior of `T::__reflection_register`
   *  generated by Thrift 1.
   *
   *  NOTE: look at the top of this file for instructions on how to enable
   *  reflection support.
   *
   *  Usage example:
   *
   *    //  MyModule.thrift
   *    struct MyStruct {}
   *
   *    //  C++
   *    LOG(INFO) << apache::thrift::legacy_reflection<MyStruct>::name();
   *    //  Writes the log line:
   *    //    struct MyModule.MyStruct
   */
  static constexpr folly::StringPiece name();

  /***
   *  Returns the legacy reflection id of a Thrift type `T` using Thrift's
   *  static reflection support.
   *
   *  Mimics the behavior of `T::_reflection_id` generated by Thrift 1.
   *
   *  NOTE: look at the top of this file for instructions on how to enable
   *  reflection support.
   *
   *  Usage example:
   *
   *    //  MyModule.thrift
   *    struct MyStruct {}
   *
   *    //  C++
   *    LOG(INFO) << apache::thrift::legacy_reflection<MyStruct>::id();
   *    //  Writes the log line:
   *    //    <some constant 64-bit unsigned integer>
   *
   *  WARNING: This function uses a hash function implemented by OpenSSL; which
   *  is not thread-safe until OpenSSL is initialized.
   */
  static legacy_reflection_id_t id();
};

} // namespace thrift
} // namespace apache

#include <thrift/lib/cpp2/reflection/internal/legacy_reflection-inl-post.h>