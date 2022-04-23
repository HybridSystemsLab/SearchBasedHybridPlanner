
clc
clear all
close all
addpath('bouncingballfiles')
% addpath('acuatedpointmassfiles')
% addpath('thermostatfiles')
% addpath('jugglingapparatus')
%addpath('bipedfiles_simplified')

initialization;

current_time = datestr(datetime('now'));

global backwardsystemdata_flag;
backwardsystemdata_flag = 0; %0: read the backward-in-time system data from external files...
                             %1: fill the backward-in-time system data from
                             %the forward-in-time system data.
plotflag = 0; %0: do not plot search tree during execution...
              %1: plot search tree during execution 
                             
                             
tic
edge_mapfw = containers.Map('KeyType','double','ValueType','any');
edge_mapbw = containers.Map('KeyType','double','ValueType','any');

Gfw = digraph;

Gbw = digraph;

reachedsetfw = containers.Map('KeyType','double','ValueType','any');
reachedsetbw = containers.Map('KeyType','double','ValueType','any');

[Gfw, I_new, edge_mapfw, reachedsetfw] = addnodetograph(Gfw, x0, edge_mapfw, reachedsetfw);

[Gbw, I_new, edge_mapbw, reachedsetbw] = addnodetograph(Gbw, xf, edge_mapbw, reachedsetbw);

Qfw = dfsearch(Gfw,1) ; %queue forward
Qbw = dfsearch(Gbw,1); %queue backward

visitedmapfw = containers.Map('KeyType','double','ValueType','double');
visitedmapbw = containers.Map('KeyType','double','ValueType','double');

visitedmapfw(1) = 1;
visitedmapbw(1) = 1;

while((~isempty(Qfw)) || (~isempty(Qbw)))
    if (~isempty(Qfw))
        I = Qfw(1); Qfw(1) = [];
        [Gfw, Qfw, edge_mapfw, reachedsetfw, visitedmapfw, isextendedfw, Iextendedfw] = extend(I, 1, U_C_fw, U_D_fw, Gfw, Qfw, edge_mapfw, reachedsetfw, visitedmapfw, plotflag);
    end
    if (~isempty(Qbw))
        I = Qbw(1); Qbw(1) = [];
        [Gbw, Qbw, edge_mapbw, reachedsetbw, visitedmapbw, isextendedbw, Iextendedbw] = extend(I, 2, U_C_bw, U_D_bw, Gbw, Qbw, edge_mapbw, reachedsetbw, visitedmapbw, plotflag);
    end

    [flag, ifw, ibw] = checksolution(Gfw, Gbw, reachedsetfw, reachedsetbw, Iextendedfw, Iextendedbw, isextendedfw, isextendedbw);
    if (flag)
        toc
            solutionfw = plotsolution(Gfw, ifw, edge_mapfw, 1);
            solutionbw = plotsolution(Gbw, ibw, edge_mapbw, 2);
            solution = reverseandconcatenate(solutionfw,solutionbw);
            plotmotionplan;
%             saveas(gcf,[current_time '/planfigure.fig'])
            mkdir(['data/' current_time]);
            save(['data/' current_time '/data.mat']);
            return;
    end
end
toc

