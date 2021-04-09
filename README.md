# csc2008-grpAssg
## Team Organisation
| Team Members                       | ID        |
|------------------------------------|-----------|
| Yip Xue Ying Magdalene             | 1901841   |
| Goh Ru Hui                         | 1901867   |
| Stuart Theodore Koh Wen You        | 1901858   |
| Abdel Haadee Faahym Bin Hisham     | 1901853   |
| Tan Qi Guang                       | 1901844   |
| Tan Zhen Xuan                      | 1901882   |

## Application Background
This project allows the SPS(Singapore Prison Service)  and MHA(Ministry of Home Affairs) staff to register and check for prisoners in academic, vocational and/or rehabilitation programmes, aiming to give past offenders a second chance and to re-assimilate them into society whilst equipping them with the necessary skills. It will also display the grades of prisoners in programmes to help SPS and MHA staff to allocate inmates to appropriate work programmes if necessary.

Our application is unique as it humanises the inmates through the creation of a centralised database system which aims to monitor the inmates’ learning progress in contrast to the existing technology like video analytics system and facial recognition, which aims to track the inmates’ location and manage their visitation sessions. The application is beneficial as it provides a form of management system for SPS and MHA to monitor and track the inmates’ progress in the respective rehabilitation and/or self-improvement programmes they are registered in so that their respective case officers are better able to advise them.

We hope that the application will make a positive impact on the inmates back into society, by allowing them to be productive members of society. Additionally, we aim to provide SPS and MHA with the appropriate statistical data to analyse the effectiveness of the individual programmes (measured by the number of passes) so that they are able to gauge if necessary improvements are needed to be made to the programmes.

## Implementation Plan
The system will be able to offer suggestions for suitable programmes for inmates to enroll in for higher chances of employment upon release. We will be using the datasets to average out possible scores to allocate inmates to different vocational programmes.

The system will also provide effective analysis to determine factors or programmes that could allow inmates to have a higher chance to assimilate back into society. Additionally, the system will help determine the effectiveness of rehabilitation through an analysis report to appeal to more organisations to partake in the good cause.

## Datasets
- Academic Programmes: https://data.gov.sg/dataset/academic-programmes
- Vocational Programmes: https://data.gov.sg/dataset/vocational-programmes?resource_id=7b0730d3-c1e0-4928-9996-89b8278802a2
- Population of Inmates in DRC: https://data.gov.sg/dataset/population-of-inmates-in-drc
- Inmates admitted to undergo rehabilitation in DRC: https://data.gov.sg/dataset/inmates-admitted-to-undergo-treatment-and-rehabilitation-in-drug-rehabilitation-centre-drc
- Inmates released from DRC: https://data.gov.sg/dataset/inmates-released-from-drc
- Yearly Enrollment of Inmates in Academic Programmes: https://data.gov.sg/dataset/academic-programmes?view_id=95736a0e-0752-4050-bfcb-acfc10352f43&resource_id=bcff6d31-10ec-470b-b861-bda761a3a370 

## ERD Diagram
![alt text](https://github.com/921am/csc2008-grpAssg/blob/main/csc2008ERD.png)

## To run ASP.NET application
- Create Database under SQL Server Object Explorer
- Database name: CRUD
- Run the solution ``` .sln ``` file 

## To populate the Database and include all the queries
- Run all the ``` runAll_part<1/2/3/4>.sql ``` queries in CRUD

## To Migrate
- Run SQL scripts ```SELECT * FROM TABLE``` to get the results.
	- Do make sure that the results are set to grids
- Right click on the results and click ```Save result as``` to save the csv files in the same folder as ```MongoDB-Migration.ipynb```
	- Do make sure that the csv files are named correctly:
		1. acadProgramme.csv
		2. drugRehabProgramme.csv
		3. inmateProgress.csv
		4. inmates.csv
		5. vocationalProgramme.csv
	- Insert header in the csv files as per the tables' attribute
- Launch jupyer-notebook and run ```MongoDB-Migration.ipynb```

