/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
#include "thrift/compiler/test/fixtures/refs/gen-cpp/includes_types.h"
#include "thrift/compiler/test/fixtures/refs/gen-cpp/includes_data.h"

#include "thrift/compiler/test/fixtures/refs/gen-cpp/includes_reflection.h"

#include <algorithm>
#include <string.h>

#include <folly/Indestructible.h>

namespace cpp1 {

const uint64_t Included::_reflection_id;
void Included::_reflection_register(::apache::thrift::reflection::Schema& schema) {
   ::cpp1::includes_reflection_::reflectionInitializer_16202005076139393548(schema);
}

bool Included::operator == (const Included & rhs) const {
  if (!(this->some_val == rhs.some_val))
    return false;
  return true;
}

void Included::readFromJson(const char* jsonText, size_t len, const folly::json::serialization_opts& opts)
{
  folly::dynamic parsed = folly::parseJson(folly::StringPiece(jsonText, len), opts);
  if (parsed["some_val"] != nullptr) {
    int64_t _tmp1 = (int64_t)parsed["some_val"].asInt();
    if (imaxabs(_tmp1) > 0x7fff) {
      throw apache::thrift::TLibraryException("number exceeds limit in field");
    } else {
      this->some_val = (int16_t)_tmp1;
    }
    this->__isset.some_val = true;
  } else {
    this->__isset.some_val = false;
  }
}
void Included::readFromJson(const char* jsonText, const folly::json::serialization_opts& opts)
{
  readFromJson(jsonText, strlen(jsonText), opts);
}

uint32_t Included::read(apache::thrift::protocol::TProtocol* iprot) {

  uint32_t xfer = 0;
  std::string _fname;
  apache::thrift::protocol::TType _ftype;
  int16_t fid;

  ::apache::thrift::reflection::Schema * schema = iprot->getSchema();
  if (schema != nullptr) {
     ::cpp1::includes_reflection_::reflectionInitializer_16202005076139393548(*schema);
    iprot->setNextStructType(Included::_reflection_id);
  }
  xfer += iprot->readStructBegin(_fname);

  using apache::thrift::protocol::TProtocolException;



  while (true)
  {
    xfer += iprot->readFieldBegin(_fname, _ftype, fid);
    if (_ftype == apache::thrift::protocol::T_STOP) {
      break;
    }
    switch (fid)
    {
      case 1:
        if (_ftype == apache::thrift::protocol::T_I16) {
          xfer += iprot->readI16(this->some_val);
          this->__isset.some_val = true;
        } else {
          xfer += iprot->skip(_ftype);
        }
        break;
      default:
        xfer += iprot->skip(_ftype);
        break;
    }
    xfer += iprot->readFieldEnd();
  }

  xfer += iprot->readStructEnd();

  return xfer;
}

void Included::__clear() {
  some_val = 0;
  __isset.__clear();
}
uint32_t Included::write(apache::thrift::protocol::TProtocol* oprot) const {
  uint32_t xfer = 0;
  xfer += oprot->writeStructBegin("Included");
  xfer += oprot->writeFieldBegin("some_val", apache::thrift::protocol::T_I16, 1);
  xfer += oprot->writeI16(this->some_val);
  xfer += oprot->writeFieldEnd();
  xfer += oprot->writeFieldStop();
  xfer += oprot->writeStructEnd();
  return xfer;
}

void swap(Included &a, Included &b) {
  using ::std::swap;
  (void)a;
  (void)b;
  swap(a.some_val, b.some_val);
  swap(a.__isset, b.__isset);
}

void merge(const Included& from, Included& to) {
  using apache::thrift::merge;
  merge(from.some_val, to.some_val);
  to.__isset.some_val = to.__isset.some_val || from.__isset.some_val;
}

void merge(Included&& from, Included& to) {
  using apache::thrift::merge;
  merge(std::move(from.some_val), to.some_val);
  to.__isset.some_val = to.__isset.some_val || from.__isset.some_val;
}

} // namespace
