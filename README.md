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
concat | torch.cat | complete
gather | torch.gather | complete
argmin | torch.argmin | complete
broadcast | torch.broadcast_to | complete
layernorm | torch.layernorm | complete



#Model Status

Model | Status
------------- | -------------
Resnet | Done
Bert | in-progress
MASK-RCNN | untested
