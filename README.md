# Torch to execution status
Op | python func | lowering status
------------- | ------------- | -------------
tanh | torch.tanh | complete
relu | torch.relu | complete
sigmoid | torch.sigmoid | complete
mul | torch.mul | complete
add | torch.add | complete
sum | torch.sum | complete
argmax | torch.argmax | complete
broadcast | torch.broadcast_to | torch_ods_gen
concat | torch.cat | RefineTypes
argmin | torch.argmin | torch_ods_gen
gather | torch.gather | RefineTypes
layernorm | torch.layernorm | torch_ods_gen
transpose | torch.transpose | torch_ods_gen
