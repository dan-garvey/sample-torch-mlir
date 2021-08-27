DEBUG: Initial PyTorch object graph IR:
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,2],f32>}) -> !torch.tensor {
    %false = torch.constant.bool false
    %none_0 = torch.constant.none
    %int1 = torch.constant.int 1
    %int0 = torch.constant.int 0
    %1 = torch.prim.ListConstruct %int0, %int0 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %2 = torch.prim.ListConstruct %int1, %int0 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %3 = torch.prim.ListConstruct %1, %2 : (!torch.list<!torch.int>, !torch.list<!torch.int>) -> !torch.list<!torch.list<!torch.int>>
    %4 = torch.aten.tensor %3, %none_0, %none_0, %false : !torch.list<!torch.list<!torch.int>>, !torch.none, !torch.none, !torch.bool -> !torch.tensor
    %5 = torch.aten.gather %arg1, %int1, %4, %false : !torch.tensor, !torch.int, !torch.tensor, !torch.bool -> !torch.tensor
    return %5 : !torch.tensor
  }
  torch.class_type @__torch__.TestModule  {
    torch.attr private "training" : !torch.bool
    torch.attr private "_is_full_backward_hook" : !torch.optional<!torch.bool>
    torch.method "forward", @__torch__.TestModule.forward
  }
  %true = torch.constant.bool true
  %none = torch.constant.none
  %0 = torch.nn_module  {
    torch.slot "training", %true : !torch.bool
    torch.slot "_is_full_backward_hook", %none : !torch.none
  } : !torch.nn.Module<"__torch__.TestModule">
}

DEBUG: Running Torch object graph lowering pipeline 'torchscript-to-npcomp-backend-pipeline'
error: unsupported by backend lowering: tensor with unknown rank or dtype
note: see current operation: %7 = "torch.aten.tensor"(%6, %2, %2, %3) : (!torch.list<!torch.list<!torch.int>>, !torch.none, !torch.none, !torch.bool) -> !torch.vtensor
note: this is likely due to a missing case in RefineTypes
Traceback (most recent call last):
  File "frontends/pytorch/examples/torchscript_gather_e2e_iree.py", line 44, in <module>
    compiled = backend.compile(frontend_lowering.lower_object_graph(mb.module))
  File "/home/dan/mlir-npcomp/build/python_packages/npcomp_core/npcomp/compiler/pytorch/backend/frontend_lowering.py", line 59, in lower_object_graph
    pm.run(imported_module)
RuntimeError: Failure while executing pass pipeline.
