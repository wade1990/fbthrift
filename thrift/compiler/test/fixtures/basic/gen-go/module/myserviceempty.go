// Autogenerated by Thrift Compiler (facebook)
// DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
// @generated

package module

import (
	"bytes"
	"sync"
	"fmt"
	"git.apache.org/thrift.git/lib/go/thrift"
)

// (needed to ensure safety because of naive import list construction.)
var _ = thrift.ZERO
var _ = fmt.Printf
var _ = sync.Mutex{}
var _ = bytes.Equal

type MyServiceEmpty interface {}

type MyServiceEmptyClient struct {
  Transport thrift.Transport
  ProtocolFactory thrift.ProtocolFactory
  InputProtocol thrift.Protocol
  OutputProtocol thrift.Protocol
  SeqId int32
}

func (client *MyServiceEmptyClient) Close() error {
  return client.Transport.Close()
}

func NewMyServiceEmptyClientFactory(t thrift.Transport, f thrift.ProtocolFactory) *MyServiceEmptyClient {
  return &MyServiceEmptyClient{Transport: t,
    ProtocolFactory: f,
    InputProtocol: f.GetProtocol(t),
    OutputProtocol: f.GetProtocol(t),
    SeqId: 0,
  }
}

func NewMyServiceEmptyClientProtocol(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyServiceEmptyClient {
  return &MyServiceEmptyClient{Transport: t,
    ProtocolFactory: nil,
    InputProtocol: iprot,
    OutputProtocol: oprot,
    SeqId: 0,
  }
}

func NewMyServiceEmptyClient(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyServiceEmptyClient {
  return &MyServiceEmptyClient{Transport: t,
    ProtocolFactory: nil,
    InputProtocol: iprot,
    OutputProtocol: oprot,
    SeqId: 0,
  }
}


type MyServiceEmptyThreadsafeClient struct {
  Transport thrift.Transport
  ProtocolFactory thrift.ProtocolFactory
  InputProtocol thrift.Protocol
  OutputProtocol thrift.Protocol
  SeqId int32
  Mu sync.Mutex
}

func NewMyServiceEmptyThreadsafeClientFactory(t thrift.Transport, f thrift.ProtocolFactory) *MyServiceEmptyThreadsafeClient {
  return &MyServiceEmptyThreadsafeClient{Transport: t,
    ProtocolFactory: f,
    InputProtocol: f.GetProtocol(t),
    OutputProtocol: f.GetProtocol(t),
    SeqId: 0,
  }
}

func NewMyServiceEmptyThreadsafeClientProtocol(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyServiceEmptyThreadsafeClient {
  return &MyServiceEmptyThreadsafeClient{Transport: t,
    ProtocolFactory: nil,
    InputProtocol: iprot,
    OutputProtocol: oprot,
    SeqId: 0,
  }
}

func NewMyServiceEmptyThreadsafeClient(t thrift.Transport, iprot thrift.Protocol, oprot thrift.Protocol) *MyServiceEmptyThreadsafeClient {
  return &MyServiceEmptyThreadsafeClient{Transport: t,
    ProtocolFactory: nil,
    InputProtocol: iprot,
    OutputProtocol: oprot,
    SeqId: 0,
  }
}

func (p *MyServiceEmptyThreadsafeClient) Threadsafe() {}


type MyServiceEmptyProcessor struct {
  processorMap map[string]thrift.ProcessorFunction
  handler MyServiceEmpty
}

func (p *MyServiceEmptyProcessor) AddToProcessorMap(key string, processor thrift.ProcessorFunction) {
  p.processorMap[key] = processor
}

func (p *MyServiceEmptyProcessor) GetProcessorFunction(key string) (processor thrift.ProcessorFunction, ok bool) {
  processor, ok = p.processorMap[key]
  return processor, ok
}

func (p *MyServiceEmptyProcessor) ProcessorMap() map[string]thrift.ProcessorFunction {
  return p.processorMap
}

func NewMyServiceEmptyProcessor(handler MyServiceEmpty) *MyServiceEmptyProcessor {

  self56 := &MyServiceEmptyProcessor{handler:handler, processorMap:make(map[string]thrift.ProcessorFunction)}
return self56
}

func (p *MyServiceEmptyProcessor) Process(iprot, oprot thrift.Protocol) (success bool, err thrift.Exception) {
  name, _, seqId, err := iprot.ReadMessageBegin()
  if err != nil { return false, err }
  if processor, ok := p.GetProcessorFunction(name); ok {
    return processor.Process(seqId, iprot, oprot)
  }
  iprot.Skip(thrift.STRUCT)
  iprot.ReadMessageEnd()
  x57 := thrift.NewApplicationException(thrift.UNKNOWN_METHOD, "Unknown function " + name)
  oprot.WriteMessageBegin(name, thrift.EXCEPTION, seqId)
  x57.Write(oprot)
  oprot.WriteMessageEnd()
  oprot.Flush()
  return false, x57

}


// HELPER FUNCTIONS AND STRUCTURES


