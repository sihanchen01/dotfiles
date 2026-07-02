 require('nightfox').setup({
     -- disable_background = true
     options = {
         transparent = false,
         styles = {
             comments = "italic" ,
             keywords = "bold"
         }
     }
 })


function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils('nightfox')
