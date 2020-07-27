function [matrix,solution,m_code] = get_fullset_matrix()

no = randperm(2,1); 

if no==1
m = load('Matrix1_new');
fn = fieldnames(m.matrix1_new);
mno = randperm(5,1);
matrix = m.matrix1_new.(fn{mno});
sol = load('Solution1_new');
solution = sol.solution1_new.(fn{mno});
m_code = "S" + no + "M" + mno;

else
    m = load('Matrix2_new');
    fn = fieldnames(m.matrix2_new);
    mno = randperm(5,1);
    matrix = m.matrix2_new.(fn{mno});
    sol = load('Solution2_new');
    solution = sol.solution2_new.(fn{mno});
    m_code = "S" + no + "M" + mno;
end

end