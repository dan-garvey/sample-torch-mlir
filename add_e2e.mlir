iree-translate main is at 0x4759f0
DEBUG: Initial PyTorch object graph IR:
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %int1 = torch.constant.int 1
    %1 = torch.aten.add.Tensor %arg1, %arg1, %int1 : !torch.tensor, !torch.tensor, !torch.int -> !torch.tensor
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
  builtin.func @forward(%arg0: tensor<2x3x?xf32>) -> tensor<?x?x?xf32> {
    %c2 = constant 2 : index
    %c1_i64 = constant 1 : i64
    %0 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %1 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %2 = cmpi eq, %0, %1 : index
    assert %2, "mismatched size for broadcast"
    %3 = linalg.init_tensor [2, 3, %0] : tensor<2x3x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg0 : tensor<2x3x?xf32>, tensor<2x3x?xf32>) outs(%3 : tensor<2x3x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):  // no predecessors
      %6 = sitofp %c1_i64 : i64 to f32
      %7 = mulf %arg2, %6 : f32
      %8 = addf %arg1, %7 : f32
      linalg.yield %8 : f32
    } -> tensor<2x3x?xf32>
    %5 = tensor.cast %4 : tensor<2x3x?xf32> to tensor<?x?x?xf32>
    return %5 : tensor<?x?x?xf32>
  }
}

DEBUG: Running Prepare For IREE pipeline 'npcomp-backend-to-iree-frontend-pipeline'
DEBUG: IREE Input IR (this is what IREE's compiler will see):
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
builtin.module  {
  builtin.func @forward(%arg0: tensor<2x3x?xf32>) -> tensor<?x?x?xf32> {
    %c2 = constant 2 : index
    %c1_i64 = constant 1 : i64
    %0 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %1 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>
    %2 = cmpi eq, %0, %1 : index
    assert %2, "mismatched size for broadcast"
    %3 = linalg.init_tensor [2, 3, %0] : tensor<2x3x?xf32>
    %4 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg0 : tensor<2x3x?xf32>, tensor<2x3x?xf32>) outs(%3 : tensor<2x3x?xf32>) {
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):  // no predecessors
      %6 = sitofp %c1_i64 : i64 to f32
      %7 = mulf %arg2, %6 : f32
      %8 = addf %arg1, %7 : f32
      linalg.yield %8 : f32
    } -> tensor<2x3x?xf32>
    %5 = tensor.cast %4 : tensor<2x3x?xf32> to tensor<?x?x?xf32>
    return %5 : tensor<?x?x?xf32>
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
  [[[0.9925132 ]
    [1.5364436 ]
    [0.17695487]]

   [[0.26406097]
    [0.61484563]
    [1.2681574 ]]]
JIT Result:
  [[[0.9925132 ]
    [1.5364436 ]
    [0.17695487]]

   [[0.26406097]
    [0.61484563]
    [1.2681574 ]]]
builtin.module  {
  builtin.func private @__torch__.TestModule.forward(%arg0: !torch.nn.Module<"__torch__.TestModule">, %arg1: !torch.tensor {torch.type_bound = !torch.vtensor<[2,3,?],f32>}) -> !torch.tensor {
    %int1 = torch.constant.int 1
    %1 = torch.aten.add.Tensor %arg1, %arg1, %int1 : !torch.tensor, !torch.tensor, !torch.int -> !torch.tensor
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
