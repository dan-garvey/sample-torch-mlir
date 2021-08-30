# Torch to execution status
Op | python func | lowering status
------------- | ------------- | -------------
tanh | torch.tanh | complete
relu | torch.relu | complete
sigmoid | torch.sigmoid | complete
layernorm | torch.layernorm | torch_ods_gen
transpose | torch.transpose | torch_ods_gen
sum | torch.sum | torch_ods_gen
broadcast | torch.broadcast_to | torch_ods_gen
concat | torch.cat | RefineTypes
mul | torch.mul | complete
add | torch.add | complete
argmin | torch.argmin | torch_ods_gen
argmax | torch.argmax | torch_ods_gen
gather | torch.gather | RefineTypes
