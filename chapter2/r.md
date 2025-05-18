1. 2
2. 4
3. 3
4. 1
5. 1
6. 1
7. 3
8. 3
9. 4
10. 5
11.
(1) 후보키: 주민등록번호, 주소 - 유일성과 최소성을 만족했기 때문
(2) 슈퍼키: 사원번호 - 유일성 충족
(3) 생년월일은 NULL 불가능
(4) 주소도 NULL 가능
12.
(1) R: {A, B}, S: {C, D, E} →  
- R 후보키: (A, B)  
- S 후보키: (C, D)  
(2) 기본키는 R의 A가 유일하므로 A 가능.
13.
- 1. a2인 튜플 반환
- 2. A,B 속성 가진 것만 반환
- 3. a2 b1
- 4. 다 곱한 결과 반환
- 5. (a1, b1, c1, c1, d2, e1), (a1, b1, c1, c1, d1, e2), (a2, b1, c1, c1, d2, e1), (a2, b1, c1, c1, d1, e2), (a3, b1, c2, c2, d3, e3)
- 6. Left Outer Join (a1, b1, c1, c1, d2, e1), (a1, b1, c1, c1, d1, e2), (a2, b1, c1, c1, d2, e1), (a2, b1, c1, c1, d1, e2), (a3, b1, c2, c2, d3, e3), (a4, b2, c4, NULL, NULL, NULL)
- 7. Right Outer Join (a1, b1, c1, c1, d2, e1), (a2, b1, c1, c1, d2, e1), (a1, b1, c1, c1, d1, e2), (a2, b1, c1, c1, d1, e2), (a3, b1, c2, c2, d3, e3), (NULL, NULL, NULL, c5, d3, e3)
- 8. Full Outer Join (a1, b1, c1, c1, d2, e1), (a1, b1, c1, c1, d1, e2), (a2, b1, c1, c1, d2, e1), (a2, b1, c1, c1, d1, e2), (a3, b1, c2, c2, d3, e3), (a4, b2, c4, NULL, NULL, NULL), (NULL, NULL, NULL, c5, d3, e3)
- 9. (c1, c2, c4, c5)
- 10. (c1, c2)
14.





















