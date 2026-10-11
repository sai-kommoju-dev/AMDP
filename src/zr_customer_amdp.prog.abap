REPORT zr_customer_amdp.
TYPES:BEGIN OF ty_cust,
        kunnr TYPE kunnr,
        land1 TYPE land1_gp,
        name1 TYPE name1_gp,
        ort01 TYPE ort01_gp,
      END OF ty_cust.
DATA lt_kna1 TYPE TABLE OF ty_cust.
PARAMETERS p_kunnr TYPE kunnr.
*--Calling AMDP method using Class name
START-OF-SELECTION.
zcl_amdp_example=>fetch_customer( EXPORTING lv_kunnr = p_kunnr
                                  IMPORTING lt_cust = lt_kna1 ).
cl_demo_output=>display( lt_kna1 ).
END-OF-SELECTION.
