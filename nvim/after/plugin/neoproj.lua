local status, neoproj = pcall(require, "neoproj")
if not status then return end

neoproj.setup {
    project_path = "C:\\PatrickSimetzberger\\projects"
}