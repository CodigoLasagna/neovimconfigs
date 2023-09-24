local work_dir = ""
local school_dir = ""
if (Hostname == "LEGION") then
	work_dir = "~/gen/archives/work/coding/notes/work"
	school_dir = "~/gen/archives/work/coding/notes/school"
elseif (Hostname == "EONIX") then
	work_dir = "~/work/coding/notes/work"
	school_dir = "~/work/coding/notes/school"
end

require'neorg'.setup
{
	load =
	{
		['core.defaults'] = {},
		['core.concealer'] =
		{
			config =
			{
				icon_preset = "diamond"
			}
		},
		['core.dirman'] =
		{
			config =
			{
				workspaces =
				{
					work = work_dir,
					school = school_dir,
				}
			}
		}
	}
}
