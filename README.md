# Power Method
 
 Power Meothod는 가장 큰 eigenvalue와 그에 따른 eigenvector를 찾는 반복법입니다.

  - Eigenvalue
  - Eigenvector


# example
power method로 대칭 행렬의 가장 큰 eigenvalue와 가장 작은 eigenvalue를 구하고, 그에 따른 eigenvector를 구하시오.
  - 파일 이름은 power.m이며 power 함수의 input variables는 아래와 같음
A = [ 40, -20, 0 ; -20, 40, -20 ; 0, -20, 40]
es = 0.05
maxit = 100 
  - 행렬 A가 square matrix인지, 만약 square matrix라면 symmetric인지 확인하는 코드를 넣을 것
  - 가장 큰 eigenvalue를 선택할 것인지, 가장 작은 eigenvalue를 선택할 것인지에 따라 eigenvalue와 그에 따른 eigenvector를 나타낼 것
