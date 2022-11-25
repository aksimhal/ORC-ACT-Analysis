%% Generate Curvature Matrixes
% Load the connectivity matrixes
load('../../data/norm_conn_data.mat');
% 'norm_conn_TP1', 'norm_conn_TP2'

curvature_mat_TP1 = zeros(83, 83, size(norm_conn_TP1, 3));
curvature_mat_TP2 = zeros(83, 83, size(norm_conn_TP2, 3));

parfor n = 1:size(norm_conn_TP1, 3)
    tic;
    A_TP1 = norm_conn_TP1(:, :, n);
    A_TP2 = norm_conn_TP2(:, :, n);
    K_TP1 = calculate_curvature(A_TP1);
    toc;
    disp(n);
    
    tic;
    K_TP2 = calculate_curvature(A_TP2);
    curvature_mat_TP1(:, :, n) = K_TP1;
    curvature_mat_TP2(:, :, n) = K_TP2;
    disp(n);
    toc; 
end



save('../../data/curvature_DukeACT.mat', 'curvature_mat_TP1', 'curvature_mat_TP2');
