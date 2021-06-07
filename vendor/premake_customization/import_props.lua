require ('vstudio')

premake.api.register {

    name = "importprops",

    scope = "config",

    kind = "list:path",

    tokens = true
}

premake.override(premake.vstudio.vc2010, "propertySheets", function(base, cfg)
	if cfg.importprops and #cfg.importprops > 0 then

        for i = 1, #cfg.importprops do

            local prop = premake.project.getrelative(cfg.project, cfg.importprops[i])

        premake.w('<Import Project="%s"/>', prop);

        end

    end
	base(cfg)
end)
