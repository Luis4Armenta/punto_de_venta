import { Request, Response } from 'express'
import { connect, DataBaseConnection } from '../database';
import { Category } from '../interfaces/category.interface';
import { MySQLInsertResponse } from '../interfaces/mySQLInsertResponse.interface';
import { MySQLUpdateResponse } from '../interfaces/mySQLUpdatedResponse.interface';
import { deleteRow, getRow, getTable, updateRow } from './mysql.controller'



export async function getCategories(req: Request, res: Response): Promise<Response> {
    const categories: Category[] = await getTable('categoria');
    console.log(categories);
    return res.json(categories);
}

export async function getCategory(req: Request, res: Response): Promise<Response> {
    console.log('llego');
    const categoryId: number = parseInt(req.params.categoryId)
    const category: Category = await getRow('categoria', 'categoria_id', categoryId).then((resp: any) => resp[0]);
    console.log(category);
    return res.json(category);
}

export async function newCategory(req: Request, res: Response): Promise<Response> {
    const newCategory: Category = req.body;
    const conn  =  await DataBaseConnection.getInstance().getConnection()
    const resp: MySQLInsertResponse = await conn.query(`INSERT INTO categoria (nombre) values (?)`, [newCategory.nombre]).then((resp: any)=>resp[0]);
    if (resp.affectedRows) {
        return res.json({
            message: 'category added',
            category_id: resp.insertId
        });
    } else {
        return res.json({
            message: 'error'
        })
    }
}

export async function updateCategory(req: Request, res: Response): Promise<Response> {
    console.log('llego algo');
    const categoryUpdated = req.body;
    console.log('update', categoryUpdated);
    const id = parseInt(req.params.categoryId);
    console.log('id', id);
    const resp: MySQLUpdateResponse = await updateRow('categoria', 'categoria_id', id, categoryUpdated).then((resp: any) => resp[0]);
    if (resp.changedRows) {
        return res.json({
            message: 'Category updated'
        });
    } if (!resp.changedRows && !resp.affectedRows) {
        return res.json({
            message: 'Category updated'
        });
    } else {
        return res.json({
            message: 'error'
        });
    }
}

export async function deleteCategory(req: Request, res: Response): Promise<Response> {
    const categoryId = req.params.categoryId;
    const resp = await deleteRow('categoria', 'categoria_id', categoryId);
    if (resp.affectedRows) {
        return res.json({
            message: 'Category deleted'
        });
    } if (!resp.affectedRows && !resp.warningStatus) {
        return res.json({
            message: 'Category deleted'
        });
    } else {
        return res.json({
            message: 'error'
        });
    }
}