%% About |
%-------------------------------------------------------
% Master 2 STIC
% COURSE : IBI
% SUBJECT : SOLVING KNAPSACK WITH GENETIC ALGORITHM
% REALIZED BY : CHERIET YAKOUB & KHALFAOUI HOCINE
%-------------------------------------------------------
%% MAIN SCRIPT
global Prob_Croiss Prob_Mut Pop_Size Gen_Nbr Exec_Time Objet_Nbr Poids Profit

    %% Initialisation
        Vect_Weight = round(Poids(1,:) + (Poids(2,:)-Poids(1,:)).*rand(1,Objet_Nbr));
        Vect_Profit = round(Profit(1,:) + (Profit(2,:)-Profit(1,:)).*rand(1,Objet_Nbr));
        Sac_Max_capacity = round(sum(Vect_Weight)/4);
        
        fprintf(['\n Capacite Max du Sac   :', num2str(Sac_Max_capacity),...
                     '\n Vecteur Weight :', num2str(Vect_Weight),...
                     '\n Vecteur Profit :', num2str(Vect_Profit),'\n \n']);
        
    %% Generate Population
        Chrom = zeros(Pop_Size,Objet_Nbr);
        for i = 1:Pop_Size
            Chrom (i,:) = (randi(2,1,Objet_Nbr)-1);
        end
        
    %% Verification du critere d'arret
        iteration = 1;
        time = Exec_Time;
        
        if Exec_Time == -1
            time = Gen_Nbr;
        elseif  Gen_Nbr == -1
            iteration = 1;
            Gen_Nbr = Exec_Time;
        end
        
        % Set timer
        t = timer('TimerFcn', 'stat=false; disp(''L algorithme Genetique est Terminer!'')','StartDelay',time);
        start(t)
        stat=true;
        
	%% Generations (Loop)
        while ( iteration <= Gen_Nbr && stat==true )
            
            % EVALUATE the population
                Fitness = Evaluate(Vect_Weight,Vect_Profit,Sac_Max_capacity,Chrom);
                [Fitness,index] = sort(Fitness, 'descend');
            
                Chrom = Chrom(index(1:Pop_Size),:);
                half_pop_size = Pop_Size / 2; % Take the TOP half elite ~Elitisme~
                top_half = Chrom(1:half_pop_size,:);
                Chrom = [top_half; top_half];
                disp(['generation :', num2str(iteration) ,...
                     ' Total Profit :', num2str(Fitness(1))]);
            
                %% Croissement
                Cross = ceil((Objet_Nbr - 1) * rand(half_pop_size,1));
                random = rand;
                if( random < Prob_Croiss )
                    for n=1:half_pop_size
                        Chrom(ceil(half_pop_size*rand),1:Cross(n)) = Chrom(half_pop_size + n,1:Cross(n));
                    end
                end
                
                %% Mutation
                for n = 1:half_pop_size
                    random = rand;
                    if( random < Prob_Mut )
                        xx = ceil(Pop_Size * rand);
                        yy = ceil(Objet_Nbr * rand);
                        Chrom(xx,yy)= 1 - Chrom(xx,yy); 
                    end
                end
                
            	%% Remplacement (Population Half-bottom)
                Chrom(half_pop_size + 1: end ,:) = top_half;
                %% Evaluation
                [Fitness,index] = sort(Fitness, 'descend');
                counting(iteration) = Fitness(1);
                    
                if(Gen_Nbr == iteration)
                    Solution = Chrom(1,:);
                    fprintf(['\n Taille Population : ',num2str(Pop_Size),...
                            '\n Nombre de Generation : ',num2str(Gen_Nbr),...
                            '\n Best Profit :',num2str(counting(iteration)),...
                            '\n Best Solution Found : ' ,num2str(Solution),'\n'])
                end
            % Select
            
            iteration = iteration +1;
        end
        
        %% DISPLAY
        figure(1)
        plot(1:Gen_Nbr, counting, '-');
        hold on;
        solution = top_half(1,:);