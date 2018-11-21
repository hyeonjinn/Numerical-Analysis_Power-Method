function [eig_val,eig_vec] = power(A, es, maxit)
   [row, col] = size(A);
   check = 1;
   iter = 0;
   
   if row == col % square matrix이면
       % symmetry matrix인지 테스트
       for i = 1 : row
           for j = 1 : row
               if A(i,j) == A(j,i)
                   check = check * 1;
               else 
                   check = check * 0;
               end
           end
       end
       
       if check == 1 % sqaure matrix 이면서 symmetric matrix 이면
          value = input('가장 큰 eigenvalue는 1을, 가장 작은 eigenvalue는 2를 선택하세요: ');
          
          % 가장 큰 eigenvalue 선택한 경우
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
            
            eig_valold = eig_val; % 다음 iter를 위해 현재 eig_val를 저장
            yold = eig_vec; % 다음 iter를 위해 현재 eig_vec를 저장
            if ea <= es || iter >= maxit, break, end 
          end
          
          
          % 가장 작은 eigenvalue 선택한 경우
          elseif value == 2 
          yold = ones(row,1);
          eig_valold = 0;
          while(1)
            y = inv(A) * yold; % A의 역행렬을 곱해준다.
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
            eig_val = 1/ eig_val; % 역수를 취해서 eig_val값 구한다.
            if ea <= es || iter >= maxit, break, end 
          end   
          end    

          
       else 
           error('행렬 A는 symmetric matrix만 가능합니다.')
       end
 
       
   else
      error('행렬 A는 square matrix만 가능합니다.')
   end
   
end