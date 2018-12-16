%close all
%clear,clc
initialize_microscope;
fprintf('Initialized!\n')
[c_x_ref,c_y_ref]=create_reference_windows;
T=create_lens;
[object_mask] = apply_lens( T, 1030, 1500 );
fprintf('Object applied!\n')
%%
fprintf('Slicing!\n')
fprintf('. . .\n')
object_masks = slice_object_mask(object_mask); 
clearvars object_mask
fprintf('Masks sliced!\n')
%%
global N_holes N_holes_side signal
phis_x = zeros(N_holes,1);
phis_y = zeros(N_holes,1);
fprintf('Starting calculations for each hole.\n')
fprintf('. . .\n')
for hole = 1:N_holes
    mask = object_masks(:,:,hole);                    
    signal_after_object = mask .* signal;
    sensor = propagate_light_through_space(signal_after_object);
    [center_x,center_y] = center_of_mass(abs(sensor)); 
    [phis_x(hole), phis_y(hole)] = calculate_phi(center_x, center_y, c_x_ref, c_y_ref);
end
%%
phi_x = reshape(phis_x,[N_holes_side,N_holes_side])';
phi_y = reshape(phis_y,[N_holes_side,N_holes_side])';
fprintf('Calculations done!!!\n')
%%     %phi_x = atan(Sx ./ z);
    %phi_y = atan(Sy ./ z);
global z
figure, imagesc(phi_x), title('Phi_x');
figure, imagesc(phi_y), title('Phi_y');
%figure, imagesc(atan(phi_x./z)), title('Phi_x')
%figure, imagesc(atan(phi_y./z)), title('Phi_y')
fprintf('*Experiment over*\n')