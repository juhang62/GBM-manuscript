nifnames={'Segmentation_T1Core.nii','Segmentation_T2.nii','Segmentation_T1C.nii'};

for i=1:length(segnif)
V1=niftiread(fullfile(segnif(i).dir,nifnames{1}));
V2=niftiread(fullfile(segnif(i).dir,nifnames{2}));
band=niftiread(fullfile(segnif(i).dir,nifnames{3}));
V0=(V1>0)-(band>0);
R0=(sum(sum(sum(V0)))/pi)^(1/3);
R1=(sum(sum(sum(V1)))/pi)^(1/3);
R2=(sum(sum(sum(V2)))/pi)^(1/3);
segnif(i).Rs=[R0 R1 R2];
end