enum 50100 "ANJ05 Company" implements "ANJ05 shipping company"
{
    Extensible = true;
    DefaultImplementation = "ANJ05 shipping company" = "ANJ05 DHL Management";
    value(0; DHL)
    {
    }
    value(1; MRW)
    {
        Implementation = "ANJ05 shipping company" = "ANJ05 MRW Management";
    }
    value(2; GLS)
    {
        Implementation = "ANJ05 shipping company" = "ANJ05 GLS Management";
    }
}