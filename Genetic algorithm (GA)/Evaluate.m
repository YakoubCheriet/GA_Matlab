function [ Solution ] = Evaluate( Vect_Weight,Vect_Profit,Sac_Max_capacity,Chrom )

    for i= 1:size(Chrom,1)
        sum_Values=sum(Chrom(i,:).*Vect_Profit);
        sum_Weights=sum(Chrom(i,:).*Vect_Weight);

        if sum_Weights <= Sac_Max_capacity
            Solution(i)= sum_Values;
        else
            Solution(i) = 0;
        end
    end

end

