#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>                                                                                                               
builtin.module  {                                                                                                                                             
  builtin.func @forward(%arg0: tensor<2x3x?xf32>) -> tensor<2x3x?xf32> {                                                                                      
    %c2 = constant 2 : index                                                                                                                                  
    %0 = tensor.dim %arg0, %c2 : tensor<2x3x?xf32>                                                                                                            
    %1 = linalg.init_tensor [2, 3, %0] : tensor<2x3x?xf32>                                                                                                    
    %2 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<2x3x?xf32>) outs(%1 : tensor<
2x3x?xf32>) {                                                                                                                                                 
    ^bb0(%arg1: f32, %arg2: f32):  // no predecessors                                                                                                         
      %3 = math.tanh %arg1 : f32                                                                                                                              
      linalg.yield %3 : f32                                                                                                                                   
    } -> tensor<2x3x?xf32>                                                                                                                                    
    return %2 : tensor<2x3x?xf32>
  }
}
