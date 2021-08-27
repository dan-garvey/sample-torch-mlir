iree-translate main is at 0x4759f0
DEBUG: Initial PyTorch object graph IR:
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %1 = torch.aten.tanh %arg1 : !torch.tensor -> !torch.tensor
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

DEBUG: Running Torch object graph lowering pipeline 'torchscript-to-npcomp-backend-pipeline'
DEBUG: IR passed to IREE compiler backend:
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
builtin.module  {
  builtin.func @forward(%arg0: tensor<2x3x?xf32>) -> tensor<2x3x?xf32> {
    %c2 = constant 2 : index
    %0 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %1 = linalg.init_tensor [2, 3, %0] : tensor<2x3x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x?xf32>) outs(%1 : tensor<2x3x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32):  // no predecessors
      %3 = math.tanh %arg1 : f32
      linalg.yield %3 : f32
    } -> tensor<2x3x?xf32>
    return %2 : tensor<2x3x?xf32>
  }
}

DEBUG: Running Prepare For IREE pipeline 'npcomp-backend-to-iree-frontend-pipeline'
DEBUG: IREE Input IR (this is what IREE's compiler will see):
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
builtin.module  {
  builtin.func @forward(%arg0: tensor<2x3x?xf32>) -> tensor<2x3x?xf32> {
    %c2 = constant 2 : index
    %0 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %1 = linalg.init_tensor [2, 3, %0] : tensor<2x3x?xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x?xf32>) outs(%1 : tensor<2x3x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32):  // no predecessors
      %3 = math.tanh %arg1 : f32
      linalg.yield %3 : f32
    } -> tensor<2x3x?xf32>
    return %2 : tensor<2x3x?xf32>
  }
}

Input args:
  (tensor([[[0.4963],
           [0.7682],
           [0.0885]],

          [[0.1320],
           [0.3074],
           [0.6341]]]),)
SUCCESS
PyTorch Result:
  [[[0.45916808]
    [0.6458943 ]
    [0.08824728]]

   [[0.1312686 ]
    [0.29809073]
    [0.5608543 ]]]
JIT Result:
  [[[0.45916805]
    [0.6458943 ]
    [0.08824728]]

   [[0.1312686 ]
    [0.2980907 ]
    [0.5608543 ]]]
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %1 = torch.aten.tanh %arg1 : !torch.tensor -> !torch.tensor
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
--------------------------------------------------------------------------------
