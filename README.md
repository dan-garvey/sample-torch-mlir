# Torch to execution status
Op | python func | lowering status
------------- | ------------- | -------------
tanh | torch.tanh | complete
relu | torch.relu | complete
sigmoid | torch.sigmoid | complete
mul | torch.mul | complete
add | torch.add | complete
sum | torch.sum | complete
argmax | torch.argmax | in-progress
concat | torch.cat | in-progress
transpose | torch.transpose | in-progress
gather | torch.gather | in-progress
argmin | torch.argmin | torch_ods_gen
layernorm | torch.layernorm | torch_ods_gen
broadcast | torch.broadcast_to | torch_ods_gen
