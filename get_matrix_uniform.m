%{

Input: trial_no indicating index of a uniform distribution
Output: Matrix,Solution,m_code

1. obtain matrix depending on the trial no 
2. If it is for training matrix numbers 1:8, load matrix
3. output matrix

%}


function [matrix,solution,m_code] = get_matrix_uniform(trial_no)

if trial_no<=120
    
matrix_index = load('m_inven2.mat');

no = matrix_index.matrix_random_training(trial_no,:);

if no<=4
m = load('matrixone');
fn = fieldnames(m.matrixone);
matrix = m.matrixone.(fn{no});
sol = load('solutionone');
solution = sol.solutionone.(fn{no});
m_code = "S1" + "M" + no;

else
    m = load('matrixtwo');
    fn = fieldnames(m.matrixtwo);
    mno = no-4;
    matrix = m.matrixtwo.(fn{mno});
    sol = load('solutiontwo');
    solution = sol.solutiontwo.(fn{mno});
    m_code = "S2" + "M" + mno;
end


else
    if trial_no<=405
        
    matrix_index = load('m_inven.mat');

    no = matrix_index.matrix_random(trial_no-120,:);
    
    if no<=5
        m = load('matrixone');
        fn = fieldnames(m.matrixone);
        matrix = m.matrixone.(fn{no});
        sol = load('solutionone');
        solution = sol.solutionone.(fn{no});
        m_code = "S1" + "M" + no;

    else
        m = load('matrixtwo');
        fn = fieldnames(m.matrixtwo);
        mno = no-5;
        matrix = m.matrixtwo.(fn{mno});
        sol = load('solutiontwo');
        solution = sol.solutiontwo.(fn{mno});
        m_code = "S2" + "M" + mno;
    end
    
    else
        
        matrix_index = load('m_inven.mat');

        no = matrix_index.matrix_random(trial_no-285,:);
        
            if no<=5
                m = load('matrixone');
                fn = fieldnames(m.matrixone);
                matrix = m.matrixone.(fn{no});
                sol = load('solutionone');
                solution = sol.solutionone.(fn{no});
                m_code = "S1" + "M" + no;

            else
                m = load('matrixtwo');
                fn = fieldnames(m.matrixtwo);
                mno = no-5;
                matrix = m.matrixtwo.(fn{mno});
                sol = load('solutiontwo');
                solution = sol.solutiontwo.(fn{mno});
                m_code = "S2" + "M" + mno;
            end

    end

end
    



end