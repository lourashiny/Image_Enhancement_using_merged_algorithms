function perf_dat = Evaluation(low_pass,high_pass1,high_pass2,merged1,merged2,g)

%PSNR
LowP_PSNR = psnr(low_pass,g);
HighP1_PSNR = psnr(high_pass1,g);
Merged1_PSNR = psnr(merged1,g);
HighP2_PSNR = psnr(high_pass2,g);
Merged2_PSNR = psnr(merged2,g);
PSNR_mat=[LowP_PSNR,HighP1_PSNR,HighP2_PSNR,Merged1_PSNR,Merged2_PSNR];

%Entropy
R_ent=entropy(low_pass(:,:,1));
G_ent=entropy(low_pass(:,:,2));
B_ent=entropy(low_pass(:,:,3));
LowP_ent=(R_ent+G_ent+B_ent)/3;

R_ent=entropy(high_pass1(:,:,1));
G_ent=entropy(high_pass1(:,:,2));
B_ent=entropy(high_pass1(:,:,3));
HighP1_ent=(R_ent+G_ent+B_ent)/3;

R_ent=entropy(merged1(:,:,1));
G_ent=entropy(merged1(:,:,2));
B_ent=entropy(merged1(:,:,3));
Merge1_ent=(R_ent+G_ent+B_ent)/3;

R_ent=entropy(high_pass2(:,:,1));
G_ent=entropy(high_pass2(:,:,2));
B_ent=entropy(high_pass2(:,:,3));
HighP2_ent=(R_ent+G_ent+B_ent)/3;

R_ent=entropy(merged2(:,:,1));
G_ent=entropy(merged2(:,:,2));
B_ent=entropy(merged2(:,:,3));
Merge2_ent=(R_ent+G_ent+B_ent)/3;


ent_mat=[LowP_ent,HighP1_ent,HighP2_ent,Merge1_ent,Merge2_ent];

%RMSE
LowP_rmse=rmse(low_pass,g);
HighP1_rmse=rmse(high_pass1,g);
merge1_rmse=rmse(merged1,g);
HighP2_rmse=rmse(high_pass2,g);
merge2_rmse=rmse(merged2,g);
rmse_mat=[LowP_rmse,HighP1_rmse,HighP2_rmse,merge1_rmse,merge2_rmse];

%MAE
LowP_mae=meanAbsoluteError(low_pass,g);
HighP1_mae=meanAbsoluteError(high_pass1,g);
merge1_mae=meanAbsoluteError(merged1,g);
HighP2_mae=meanAbsoluteError(high_pass2,g);
merge2_mae=meanAbsoluteError(merged2,g);
mae_mat=[LowP_mae,HighP1_mae,HighP2_mae,merge1_mae,merge2_mae];

%MSE
LowP_mse=MSE3D(g,low_pass);
HighP1_mse=MSE3D(g,high_pass1);
merge1_mse=MSE3D(g,merged1);
HighP2_mse=MSE3D(g,high_pass2);
merge2_mse=MSE3D(g,merged2);
mse_mat=[LowP_mse,HighP1_mse,HighP2_mse,merge1_mse,merge2_mse];


perf_dat=[ent_mat;rmse_mat;mae_mat;PSNR_mat;mse_mat];

return