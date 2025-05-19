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
(1) 결과: Victor, Jane
(2) 결과: ∅ (공집합)
(3) 결과:  
- John, Engineer  
- Sara, Developer  
- Victor, Programmer  
- Jane, Engineer
(4) 결과:  
- John, Engineer, New York  
- Sara, Developer, Sanfrancisco  
- Victor, Programmer, Toronto  
- Jane, Engineer, New York
(5) 결과: ∅ (공집합)
15.
(1) R × S  
→ 최대: 7 × 6 = 42개
(2) R ⨝ S  
→ 최소: 0개, 최대: 7개
(3) π_A, C (R ⨝ S)  
→ 최소: 0개, 최대: 7개
(4) π_B (R) ∪ π_B (S)  
→ 최소: 6개 (모두 중복), 최대: 13개 (모두 다름)
(5) π_B (R) − (π_B (R) − π_B (S))  
→ 결과: R.B ∩ S.B (공통되는 B 값 개수) → 최소 0개, 최대 7개
16.
(1) π_학번(σ_과목코드=1234 ∧ 성적='A'(수강))
(2) π_이름, 전공(σ_과목코드=1234(수강 ⨝ 학생))
(3) π_이름(학생) − π_이름(σ_과목코드=1234(수강 ⨝ 학생))
(4) π_이름(학생) ∩ (⋂_{C∈과목코드} π_이름(σ_과목코드=C(수강 ⨝ 학생)))  
17.
(1) 상영관 : 극장 번호 ,  예약 : 극장 번호, 상영관 번호, 고객번호
(2)
- 극장  
  - (1, 대한, 강남)  
  - (2, 씨티, 잠실)  
  - (3, 씨티, 강남)

- 상영  
  - (1, 101, 파묘, 13000, 100)  
  - (1, 102, 듄2, 14000, 80)  
  - (2, 201, 범죄도시4, 12000, 90)

- 고객  
  - (9001, 김철수, 서울 강서구)  
  - (9002, 이영희, 인천 부평구)  
  - (9003, 박민호, 경기 성남시)

- 예매  
  - (1, 101, 9001, A1, 2025-05-01)  
  - (1, 102, 9002, B2, 2025-05-02)  
  - (2, 201, 9003, C3, 2025-05-01)
(3)
- 가격이 6천 원 이상인 상영관 극장 번호
- 극장별 상영관
- 영화 가격이 6천 원 이상인 극장 이름
- 강남에 예약한 고객 이름과 극장 번호
(4) 
- σ극장 이름, 위치 (극장)
- π영화 제목( σ가격 ≤ 7000 (상영관))
- π이름, 주소 (고객)
- π영화 제목((σ위치=강남 극장) ⋈ 극장. 극장 번호 = 상여관. 극장 번호 상영관 )
- π고객 이름(σ위치=강남 (극장)) ⋈ 극장. 극장 번호=예약. 극장 번호 예약) ⋈ 예약. 고객번호=고객. 고객번호 고객)
18.
(1) πname (Salesperson)
(2) **πsalesperson (**σ custname="홍길동" (order))
(3) πsalesperson (order)
(4) πname (Salesperson) - πsalesperson (order)
(5) πage (Salesperson ⋈ salesperson.name=order.salesperson ( σcustname="홍길동" (order)))
(6) π_city (((σ_age=25 (Salesperson)) ⨝_{S.name=O.salesperson} Order) ⨝_{O.custname=C.name} Customer)
(7) π_name, custname (Salesperson ⨝_{S.name=O.salesperson} Order)

19.
(1)
Employee : empno
Department : deptno
Project : projno
Work : empno, projno
(2)
Employee : deptno
Department : manager
Project : deptno
Work : (empno, projno)
(3)
π(name) Employee
**π(name)(**σsex = "여자" (Employee))
πname, address(Employee ⋈ Department)
**πname, address(**σdeptname="IT부서" (Employee ⋈ Department))
**πname(**σprojname="미래" (Project ⋈ Works ⋈ Employee))

20.
(1) σ_dest='제주'(Flight)
(2) σ_src='김포' ∧ dest='제주'(Flight)
(3) π_fid(σ_pid=100 ∧ fdate > '2024-01-01'(Booking))
(4) π_pname(Passenger ⨝ Booking)
(5) π_pname(Passenger) − π_pname(Passenger ⨝ Booking)
(6) π_aname(σ_pcity=acity(Passenger ⨝ Agency))  
(7) σ_fdate ≥ '2024-01-01' ∧ fdate ≤ '2024-01-30' ∧ time > '16:00'(Flight)
(8) π_aname(Agency) − π_aname((σ_pid=100(Booking)) ⨝ Agency)
(9) π_*(σ_aname='마당여행사'(Agency) ⨝ Booking ⨝ σ_pgender='남'(Passenger))




