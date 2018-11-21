function [eig_val,eig_vec] = power(A, es, maxit)
   [row, col] = size(A);
   check = 1;
   iter = 0;
   
   if row == col % square matrix�̸�
       % symmetry matrix���� �׽�Ʈ
       for i = 1 : row
           for j = 1 : row
               if A(i,j) == A(j,i)
                   check = check * 1;
               else 
                   check = check * 0;
               end
           end
       end
       
       if check == 1 % sqaure matrix �̸鼭 symmetric matrix �̸�
          value = input('���� ū eigenvalue�� 1��, ���� ���� eigenvalue�� 2�� �����ϼ���: ');
          
          % ���� ū eigenvalue ������ ���
          if value == 1 
          yold = ones(row,1);
          eig_valold = 0;
          while(1)
            y = A * yold;
            eig_val = y(1); 
            for k = 1: row
                if abs(eig_val) < abs(y(k)) 
                   eig_val = y(k);
                end
            end 
            eig_vec = y / eig_val;

            iter = iter + 1;
            ea = abs((eig_val - eig_valold)/eig_val) *100;
            
            eig_valold = eig_val; % ���� iter�� ���� ���� eig_val�� ����
            yold = eig_vec; % ���� iter�� ���� ���� eig_vec�� ����
            if ea <= es || iter >= maxit, break, end 
          end
          
          
          % ���� ���� eigenvalue ������ ���
          elseif value == 2 
          yold = ones(row,1);
          eig_valold = 0;
          while(1)
            y = inv(A) * yold; % A�� ������� �����ش�.
            eig_val = y(1); 
            for k = 1: row
                if abs(eig_val) < abs(y(k)) 
                   eig_val = y(k);
                end
            end 
            eig_vec = y / eig_val;

            iter = iter + 1;
            ea = abs((eig_val - eig_valold)/eig_val) *100;
            
            eig_valold = eig_val; 
            yold = eig_vec; 
            eig_val = 1/ eig_val; % ������ ���ؼ� eig_val�� ���Ѵ�.
            if ea <= es || iter >= maxit, break, end 
          end   
          end    

          
       else 
           error('��� A�� symmetric matrix�� �����մϴ�.')
       end
 
       
   else
      error('��� A�� square matrix�� �����մϴ�.')
   end
   
end