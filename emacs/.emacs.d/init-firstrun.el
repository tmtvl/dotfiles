;;; init.el --- Emacs initialisation file.           -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Tim Van den Langenbergh

;; Author: Tim Van den Langenbergh <tmt_vdl@gmx.com>
;; Keywords: convenience, local

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU Affero General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU Affero General Public License for more details.

;; You should have received a copy of the GNU Affero General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; See init.org for a full explanation of what this file holds.

;;; Code:
;; This file will be overridden.

(let ((init-el-file "~/.emacs.d/init.el")
	  (init-org-file "~/.emacs.d/init.org"))
  (require 'org)
  (require 'ob-tangle)

  (if (file-exists-p init-org-file)
	  (save-excursion
		(find-file init-org-file)
		(org-babel-tangle)
		(load-file init-el-file)
		(byte-compile-file init-el-file)
		(load init-el-file)
		(kill-buffer))
	(warn "Could not find init.org!")))

(provide 'init)
;;; init.el ends here
