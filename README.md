# Torch to execution status
Op | python func | lowering status
------------- | ------------- | -------------
tanh | torch.tanh | complete
relu | torch.relu | complete
sigmoid | torch.sigmoid | complete
mul | torch.mul | complete
add | torch.add | complete
sum | torch.sum | complete
argmax | torch.argmax | in-review
transpose | torch.transpose | in-review
concat | torch.cat | in-progress
gather | torch.gather | in-progress
argmin | torch.argmin | in-progress
broadcast | torch.broadcast_to | in-prgoress
layernorm | torch.layernorm | torch_ods_gen



#Model Status
Model | status
------------- | -------------
Ressnet | Done
Bert | in-progress
MASK-RCNN | untested
