function [Uab,Ubc,Uca,Un,t]=upomiary
% Funkcja [Uab,Ubc,Uca]=upomiary
% zawiera pomiary napiec miedzyfazowych w V, rejestrowane co 1 min.
% na szynach 20 kV GPZ zasilajacego zaklady przemyslowe
% Wyprowadzane sa napiecia w jed. wzgl. odniesionych do Un=20 kV
Un = 20; % napiecie znamionowe w kV
   %Uab         Ubc         Uca
upom=[
20472.38	20449.95	20391.93
20465.02	20443.17	20384.7
20464.35	20442.96	20383.31
20469.97	20447.46	20388.26
20464	    20440.83	20382.2
20460.1	    20436.94	20377.84
20464.23	20440.94	20381.88
20471.56	20449.72	20390.49
20468.67	20448.26	20388.47
20477.88	20456.19	20397.23
20470.68	20448.9	    20391.42
20460.09	20438.25	20380.63
20465.33	20444	    20383.99
20473.41	20452.96	20392.24
20468.2	    20445.76	20387.95
20478.72	20457.21	20397.76
20478.96	20457.3	    20395.99
20482.08	20461.42	20399.4
20475.15	20457.6	    20396.58
20486.5	    20466.56	20406.15
20473.95	20453.23	20393.9
20481.44	20460.57	20400.65
20473.54	20451.08	20389.95
20470.81	20447.52	20386.83
20469.45	20447.49	20386.94
20475.92	20454.21	20393.45
20464.11	20442.13	20381.35
20481.23	20461.48	20399.42
20477.63	20458.23	20397.15
20479.15	20459.24	20398.96
20472.55	20452.18	20391.18
20474.06	20453.05	20391.36
20477.14	20455.32	20392.17
20479.04	20456.78	20393.72
20475.81	20454.62	20392.03
20482.87	20460.72	20398.87
20478.83	20457.36	20394.88
20460.13	20439.42	20376.84
20473.6	    20451.94	20390.14
20474.73	20453.5	20392.7
20476.5	    20453.61	20393.39
20472.74	20449.44	20388.78
20477.57	20456.75	20394.62
20477.82	20455.41	20393.6
20482.23	20461.24	20400.66
20477.44	20456.87	20394.33
20474.73	20453.14	20389.49
20481.03	20458.64	20394.64
20478.39	20457.17	20392.53
20479.51	20459.13	20396.84
20482.66	20460.87	20397.75
20484.58	20464.23	20401.59
20483.41	20464.54	20402.38
20484.9	    20465.52	20405.48
20483.83	20463.02	20405.22
20479.65	20457.77	20398.9
20492.17	20470.81	20410.39
20487.02	20465.54	20406.44
20484.06	20460.82	20401.78
20487.17	20463.93	20404.52
20487.27	20465.47	20404.92
20478.23	20457.79	20396.14
20477.05	20458.21	20396.22
20484.72	20463.54	20402.83
20476.22	20455.86	20395.8
20476.33	20455.51	20394.63
20468.92	20447.82	20387.82
20472.47	20451.07	20390.95
20471.87	20450.51	20390.08
20475.98	20455.24	20396.5
20473.21	20453.1	    20394.52
20480.26	20458.69	20400.58
20474.79	20454.78	20396.74
20471.03	20449.14	20391.46
20478.8	    20457.41	20400.08
20473.89	20454.23	20396.21
20467.3	    20447.62	20390.14
20470.02	20449.63	20392.3
20468.22	20448.19	20388.65
20474.92	20455.08	20397.73
20463.27	20443.27	20386.46
20479.26	20458.91	20401.63
20476.3	    20456.61	20397.04
20474.97	20454.94	20397.04
20477.48	20457.91	20400.16
20475.45	20455.47	20395.65
20476.96	20457.94	20397.65
20493.11	20474.36	20413.54
20490.67	20472.01	20411.91
20491.26	20472.35	20414.06
20500.78	20481.29	20421.9
20502	    20482.46	20422.82
20496.32	20476.82	20417.98
20496.81	20476.65	20418.82
20508.42	20488.94	20429.49
20506.41	20488.35	20428.67
20500.88	20483.54	20423.29
20511.25	20493.8	    20433.17
20510.74	20492.43	20432.85
20508.72	20489.6	    20431.16
20510.24	20491.98	20431.12
20504.78	20486.33	20425.39
20498.45	20480.68	20419.63
20501.4	    20481.54	20421.77
20500.92	20482.01	20421.32
20503.67	20484.29	20423.23
20503.88	20484.13	20423.65
20501.27	20481.96	20421.7
20506.96	20487.33	20428.77
20504.51	20483.93	20426.19
20497.05	20475.41	20417.61
20498.1	    20476.2	    20417.55
20490.79	20471.06	20411.76
20490.45	20469.1	    20410.09
20491.18	20468.59	20409.32
20489.76	20467.79	20407.39
20493.5	    20471.84	20409.63
20500.78	20480.12	20418.08
20487.6	    20467.98	20405.87
20493.83	20474.23	20413.89
20488.35	20469.13	20407.42
20482.71	20461.18	20401.17
20469.39	20450.97	20390.73
20479.81	20458.59	20400.48
20483.41	20462.14	20403.51
20471.66	20450.18	20392.04
20472.43	20451.61	20390.13
20467.91	20447.42	20386.36
20468.28	20447.82	20389.03
20472	    20450.71	20390.25
20481.03	20459.34	20397.98
20469.95	20450.97	20388.85
20475.72	20455.37	20394.49
20470.42	20449.24	20387.57
20471.27	20451.64	20389.67
20476.52	20456.73	20393.88
20481.06	20462.42	20397.26
20471.62	20452.53	20389.77
20471.32	20450.94	20391.37
20476.08	20457.49	20395.52
20475.48	20457.46	20394.53
20467.59	20449.65	20388.13
20474.49	20453.91	20393.62
20482.2	    20462.35	20401.55
20479.17	20459.71	20398.07
20471.22	20451.89	20391.4
20479.19	20461.55	20399.85
20481.84	20463.55	20400.72
20478.21	20459.06	20396.69
20471.61	20453.32	20391.01
20465.6	    20448.35	20385.77
20472.4	    20452.63	20391.9
20473.63	20453.77	20391.99
20477.35	20455.4	    20392.84
20478.56	20458.11	20396.96
20486.28	20465.88	20404.13
20474.98	20453.45	20393.63
20471.71	20450.64	20391.52
20471.04	20448.66	20387.84
20467.2	    20446.51	20384.56
20469.94	20449.03	20387.03
20473.21	20451.56	20390.29
20470.71	20450.36	20387.36
20471.03	20449.67	20386.11
20464.54	20444.07	20382.22
20469.83	20450.39	20385.73
20481.39	20460.9	    20397.13
20472.88	20452.32	20387.87
20474.2	    20453.05	20389.72
20476.07	20456.46	20391.72
20472.37	20452.74	20387.6
20475.98	20454.73	20390.98
20477.51	20456.78	20391.87
20486.44	20464.93	20401.17
20479.86	20460.61	20396.67
20479.54	20459.09	20395.26
20480.9	    20462.83	20398.02
20481.79	20463.6	    20398.65
20477.06	20458.86	20394.4
20468.24	20450.92	20385.96
20472.25	20454.5	    20388.6
20474.1	    20456.13	20390.25
20470.24	20451.99	20385.9
20468.11	20452.87	20386.18
20460.24	20443.38	20376.28
20461.9	    20445.37	20379
20459.27	20441.33	20374.32
20464.1	    20446.29	20380.04
20463.03	20447.34	20382.03
20464.23	20448.23	20382.97
20471.29	20453.68	20390.12
20468.62	20451.71	20388.46
20472.01	20455.8	    20391.8
20474.21	20458.91	20395.77
20471.65	20457.01	20393.67
20482	    20464.54	20401.79
20482.44	20465.13	20403.95
20479.58	20461.02	20400.29
20485.25	20468.24	20406.27
20482.96	20467.22	20405.19
20481.38	20463.4	    20401.62
20474.56	20457.69	20394.37
20468.6	    20451.18	20386.98
20467.57	20450.81	20388.58
20471.56	20455.1	    20390.94
20469.88	20452.13	20389.35
20465.49	20447.85	20384.4
20471.24	20452.56	20390.46
20481.38	20463.72	20401.06
20468.68	20450.59	20388.42
20470.45	20451.03	20389.45
20478.15	20459.12	20396.24
20475.36	20455.91	20392.4
20465.33	20445.85	20384.01
20474.45	20455.53	20392.99
20487.45	20468.33	20403.49
20475.56	20456.93	20393.46
20479.33	20460.97	20398.21
20480.97	20463.52	20401.08
20482.85	20464.34	20401.6
20486.08	20465.49	20403.71
20492.23	20472.73	20410.61
20486.12	20467.23	20406.96
20497.93	20479.73	20419.71
20489.39	20471.88	20409.38
20481.38	20463.06	20400.2
20483.21	20463.2 	20401.6
20487.6	    20468.52	20406.7
20480.58	20463.64	20400.76
20477.97	20460.4	    20398.65
20477.08	20460.07	20396
20482.51	20464.71	20399.74
20469.07	20451.56	20387.79
20462.17	20444.13	20380.27
20469.62	20452.81	20387.21
20468.94	20452.32	20386.56
20465.79	20449.96	20384.13
20482.38	20465.06	20399.31
20490.69	20474.05	20409.14
20490	    20471.41	20407.28
20489.81	20471.17	20405.45
20496.26	20477.64	20411.65
20495.72	20476.32	20410.67
20488.63	20470.64	20406
20497.41	20479.64	20413.55
20495.66	20477.94	20411.04
20489.49	20472.51	20405.11
20492.55	20474.75	20407.09
20486.26	20467	    20401.83
20478.34	20459.24	20393.71
20482.66	20464.39	20397.81
20487.38	20468.48	20401.73
20474.16	20455.02	20389.94
20464.05	20447.15	20381.38
20463.27	20445.64	20380.1
20476.4	    20457.3	    20392.29
20473.72	20454.3	    20388.82
20483.77	20464.79	20400.27
20483.39	20464.21	20401.46
20484.84	20465.67	20402.78
20503.82	20484.4	    20420.72
20505.75	20486.55	20423.58
20497.54	20476.8	    20415.03
20496.91	20476.77	20415.55
20501.57	20481.54	20420.19
20493.03	20473.5	    20411.47
20509.53	20489.75	20424.74
20506.83	20487.61	20423.17
20511.99	20490.86	20428.01
20513.31	20493.25	20429.92
20512.99	20491.69	20429.15
20508.06	20488.48	20425.78
20522.97	20502.51	20440.59
20520.26	20499.84	20441.54
20508.86	20488.7	    20429
20508.6	    20489.28	20429.61
20515.59	20497.06	20434.86
20516.76	20496.53	20436.64
20508.57	20488.87	20429.72
20514.5	    20495.6	    20433.99
20512.36	20491.3	    20430.17
20510.38	20489.79	20428.5
20496.93	20474.47	20414.19
20505.37	20482.66	20421.91
20494.97	20474.95	20414.03
20497.55	20477.6	    20416.93
20503.18	20484.65	20423.54
20500.36	20482.82	20421.16
20495.38	20476.75	20417.32
20498.47	20480.72	20420.13
20500.94	20483.46	20421.14
20501.27	20484.6	    20423.1
20506.39	20488.57	20425.03
20502.6	    20487.58	20424.73
20497.07	20482.06	20419.33
20503.69	20488.11	20425.57
20513.88	20498.51	20434.7
20504.09	20488.98	20425.75
];
Uab=upom(:,1)/Un/1000;
Ubc=upom(:,2)/Un/1000;
Uca=upom(:,3)/Un/1000;
% Uzupelnienie brakujacych chwil czasowych pomiarow
n=length(Uab);
for i=1:n
    t(i)=i; % pomiary wykonywane byly co 1 min.
end
%
return

