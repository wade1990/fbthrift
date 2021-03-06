/*
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#include <folly/io/IOBuf.h>
#include <folly/io/async/AsyncSocket.h>
#include <sys/types.h>
#include <thrift/lib/cpp/async/TAsyncSocket.h>
#include <memory>

namespace apache {
namespace thrift {
namespace async {

class TAsyncSocketIntercepted : public TAsyncSocket {
 public:
  TAsyncSocketIntercepted(
      folly::EventBase* evb,
      const folly::SocketAddress& address,
      uint32_t connectTimeout = 0)
      : folly::AsyncSocket(evb, address, connectTimeout),
        TAsyncSocket(evb, address, connectTimeout) {}
  TAsyncSocketIntercepted(
      folly::EventBase* evb,
      const std::string& ip,
      uint16_t port,
      uint32_t connectTimeout = 0)
      : folly::AsyncSocket(evb, ip, port, connectTimeout),
        TAsyncSocket(evb, ip, port, connectTimeout) {}

  ~TAsyncSocketIntercepted() override {}

  struct Params {
    std::atomic<bool> corruptLastWriteByte_{false};
    std::atomic<bool> corruptLastReadByte_{false};
    std::atomic<int32_t> corruptLastReadByteMinSize_{0};
  };

  void setParams(std::shared_ptr<Params> params) {
    params_ = params;
  }

  WriteResult performWrite(
      const iovec* vec,
      uint32_t count,
      WriteFlags flags,
      uint32_t* countWritten,
      uint32_t* partialWritten) override;

  ReadResult performRead(void** buf, size_t* buflen, size_t* offset) override;

 private:
  std::shared_ptr<Params> params_;
};

} // namespace async
} // namespace thrift
} // namespace apache
