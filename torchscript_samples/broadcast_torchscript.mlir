builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[3,3],f32>}) -> !torch.tensor {
    %int3 = torch.constant.int 3
    %1 = torch.prim.ListConstruct %int3, %int3 : (!torch.int, !torch.int) -> !torch.list<!torch.int>
    %2 = torch.operator "aten.broadcast_to"(%arg1, %1) : (!torch.tensor, !torch.list<!torch.int>) -> !torch.tensor
    return %2 : !torch.tensor
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
