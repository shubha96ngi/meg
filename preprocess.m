clear all
close all
ft_defaults
X1={}
X2={}

for i = 1:29
    name = sprintf('/media/ubuntu/HDD_P1/shubh/training/dementia/hokuto_dementia%d.mat',i);
    A = load(name)
        
    % 10 second epoch with 
    
    cfg = [];
    cfg.dataset = sprintf('/media/ubuntu/HDD_P1/shubh/training/dementia/hokuto_dementia%d.mat',i);
    hdr =  ft_read_header(cfg.dataset);
    cfg.continuous = 'yes';
    data = ft_preprocessing(cfg);

    % selecting meggrad channels only 
    
    cfg.channel = 'AG*';
    data = ft_selectdata(cfg,data);
    cfg.trialfun             = 'ft_trialfun_general';
    cfg.trialdef.triallength = 10;                   % in seconds
   
    cfg.trialdef.ntrials     = 30;    % total 30 epochs for 300s data of 10s interval each 
  
    cfg = ft_definetrial(cfg);
    data = ft_preprocessing(cfg);
    size(data)
  
    data = ft_preprocessing(cfg);

    %e = length(A.D.trials.events)
    for j = 1:30
        
        X1{j} = data.trial{j}(:,:,:);
        p1 = X1{j};
        size(p1)
        X1{j} = reshape(X1{j},1,160,(hdr.Fs)*10);
        p = X1{j};
        size(p)

        X2{j} = 2;    # label 0 for HC, 1 for MCI, 2 for Dementia
        
    end
%     for n = 1:e
    z = cat(1,X1{:});
    sz = size(z)
    z = permute(z,[3,1,2]);
    size(z)
    z1 = cat(1,X2{:});
    sz1 = size(z1)
    
    size(z1)
    
    

    s.data = z
    s.label = z1
    %z.trialinfo = 20
    filename = sprintf('hokuto_dementia%d',i)
    savename = strcat('/media/ubuntu/HDD_P1/shubh/Data_meg1/',filename,'.mat');
    save(savename, 's');

end
