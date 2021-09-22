builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %f = constant @__torch__.torch.nn.functional.layer_norm : (!torch.tensor, !torch.list<!torch.int>, !torch.optional<!torch.tensor>, !torch.optional<!torch.tensor>, !torch.float) -> !torch.tensor
    %float1.000000e-05 = torch.constant.float 1.000000e-05
    %none_0 = torch.constant.none
    %int1 = torch.constant.int 1
    %1 = torch.aten.size %arg1 : !torch.tensor -> !torch.list<!torch.int>
    %2 = torch.aten.slice.t %1, %int1, %none_0, %int1 : !torch.list<!torch.int>, !torch.int, !torch.none, !torch.int -> !torch.list<!torch.int>
    %3 = torch.derefine %none_0 : !torch.none to !torch.optional<!torch.tensor>
    %4 = torch.derefine %none_0 : !torch.none to !torch.optional<!torch.tensor>
    %5 = call_indirect %f(%arg1, %2, %3, %4, %float1.000000e-05) : (!torch.tensor, !torch.list<!torch.int>, !torch.optional<!torch.tensor>, !torch.optional<!torch.tensor>, !torch.float) -> !torch.tensor
    return %5 : !torch.tensor
  }
  builtin.func private @__torch__.torch.nn.functional.layer_norm(%arg0: !torch.tensor, %arg1: !torch.list<!torch.int>, %arg2: !torch.optional<!torch.tensor>, %arg3: !torch.optional<!torch.tensor>, %arg4: !torch.float) -> !torch.tensor {
    %true_0 = torch.constant.bool true
    %1 = torch.operator "aten.layer_norm"(%arg0, %arg1, %arg2, %arg3, %arg4, %true_0) : (!torch.tensor, !torch.list<!torch.int>, !torch.optional<!torch.tensor>, !torch.optional<!torch.tensor>, !torch.float, !torch.bool) -> !torch.tensor
    return %1 : !torch.tensor
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
