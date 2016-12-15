result=kmeans([e02,e03,e04],4);
scatter3(e02(find(result==1)),e03(find(result==1)),e04(find(result==1)))
hold on;
scatter3(e02(find(result==2)),e03(find(result==2)),e04(find(result==2)))
scatter3(e02(find(result==3)),e03(find(result==3)),e04(find(result==3)))
scatter3(e02(find(result==4)),e03(find(result==4)),e04(find(result==4)))