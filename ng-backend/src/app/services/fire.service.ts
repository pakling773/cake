import { Injectable } from '@angular/core';
import { Firestore } from '@angular/fire/firestore';

import {
  DocumentData,
  addDoc,
  collection,
  deleteDoc,
  doc,
  getDoc,
  getDocs,
  query,
  updateDoc,
  where,
  writeBatch,
  GeoPoint,
} from 'firebase/firestore';

import { AbstractControl, FormControl, FormGroup } from '@angular/forms';
import {
  ICakeCategory,
  ICakeItem,
  IFlavour,
  IOrders,
  IShop,
  ISlide,
  IUser,
} from '../models/product.items';

export enum ModuleType {
  SHOPS = 'shops',
  FLAVOURS = 'flavours',
  CATEGORY = 'category',
  CAKES = 'cakes',
  SLIDES = 'slides',
  USERS = 'users',
  ORDERS = 'orders',
}

@Injectable({
  providedIn: 'root',
})
export class FireService {
  constructor(private fs: Firestore) {}

  async getCategories() {
    const categories: ICakeCategory[] = [];

    const itemCollection = collection(this.fs, ModuleType.CATEGORY);
    const get = (await getDocs(itemCollection)).docs.map((row) => {
      const item: ICakeCategory = {
        id: row.id,
        created: row.data()['created'],
        name: row.data()['name'],
      };
      categories.push(item);
    });

    categories.sort(function compare(a, b) {
      var dateA: any = new Date(a?.created?.seconds!);
      var dateB: any = new Date(b?.created?.seconds!);
      return dateA - dateB;
    });
    return categories;
  }

  async getShops() {
    const shops: IShop[] = [];

    const itemCollection = collection(this.fs, ModuleType.SHOPS);
    (await getDocs(itemCollection)).docs.map((row) => {
      // const item: IShop = {
      //   id: row.id,
      //   name: ['name'],
      // };
      var data = row.data();

      const item: IShop = {
        address1: data['address1'],
        address2: data['address2'],
        id: row.id,
        logo: data['logo'],
        name: data['name'],
        phone_number: data['phone_number'],
        user_id: data['user_id'],
      };

      shops.push(item);
    });

    return shops;
  }

  // GET CAKES
  getCakes(): Promise<ICakeItem[]> {
    return new Promise(async (resolve, reject) => {
      try {
        const cakes: ICakeItem[] = [];
        const categories: ICakeCategory[] = await this.getCategories();
        const itemCollection = collection(this.fs, ModuleType.CAKES);
        const snapshot = await getDocs(itemCollection);

        for (const doc of snapshot.docs) {
          const data = doc.data() as DocumentData;
          const cat_id = data['category_id'];

          const item: ICakeItem = {
            id: doc.id,
            name: data['name'],
            category_id: data['category_id'],
            flavour_id: data['flavour_id'],
            price: data['price'],
            shop_id: data['shop_id'],
            photo: data['photo'],
            featured: data['featured'],
            category: categories.find((cat) => cat.id === cat_id),
            description: data['description'],
            specification: data['specification'],
          };

          cakes.push(item);
        }

        resolve(cakes);
      } catch (error) {
        console.error('Error fetching cakes:', error);
        reject(new Error(`Failed to fetch cakes: ${error}`));
      }
    });
  }

  // GET CAKES
  getCakesById(id: string): Promise<ICakeItem> {
    console.log(id);
    return new Promise(async (resolve, reject) => {
      try {
        const categories: ICakeCategory[] = await this.getCategories();

        const docRef = doc(this.fs, ModuleType.CAKES, id);
        const docSync = await getDoc(docRef);
        const data = docSync.data() as DocumentData;

        const cakes: ICakeItem = {
          id: id,
          name: data['name'],
          category_id: data['category_id'],
          flavour_id: data['flavour_id'],
          price: data['price'],
          shop_id: data['shop_id'],
          photo: data['photo'],
          featured: data['featured'],
          category: categories.find((cat) => cat.id === data['category_id']),
          description: data['description'],
          specification: data['specification'],
          tags: data['tags'],
        };

        resolve(cakes);
      } catch (error) {
        console.error('Error fetching cakes:', error);
        reject(new Error(`Failed to fetch cakes: ${error}`));
      }
    });
  }

  async saveItem(data: ICakeItem) {
    return new Promise(async (resolve, reject) => {
      try {
        if (data.id) {
          const docRef = doc(this.fs, ModuleType.CAKES, data.id);
          updateDoc(docRef, { ...data });
          resolve(docRef.id);
        } else {
          const docRef = await addDoc(
            collection(this.fs, ModuleType.CAKES),
            data
          );
          resolve(docRef.id);
        }
      } catch (error) {
        reject(error);
      }
    });
  }

  async getNearestShops(
    latitude: number,
    longitude: number,
    radiusInKm: number
  ) {
    const userPoint = new GeoPoint(latitude, longitude);
    const itemCollection = collection(this.fs, ModuleType.SHOPS);
    (await getDocs(itemCollection)).docs.map((row) => {
      var data = row.data();
      const distance = this.calculateDistance(userPoint, data['coordinates']);
      if (distance <= radiusInKm) {
        console.info(data);
      }
    });
  }

  calculateDistance(point1: GeoPoint, point2: GeoPoint) {
    const R = 6371; // Earth's radius in km
    const dLat = ((point2.latitude - point1.latitude) * Math.PI) / 180;
    const dLon = ((point2.longitude - point1.longitude) * Math.PI) / 180;
    const a =
      0.5 -
      Math.cos(dLat) / 2 +
      (Math.cos((point1.latitude * Math.PI) / 180) *
        Math.cos((point2.latitude * Math.PI) / 180) *
        (1 - Math.cos(dLon))) /
        2;
    return R * 2 * Math.asin(Math.sqrt(a));
  }

  async saveShop(data: IShop) {
    return new Promise(async (resolve, reject) => {
      try {
        const geoPoint = new GeoPoint(
          data.address1?.latitude!,
          data.address1?.longitude!
        );
        if (data.id) {
          const docRef = doc(this.fs, ModuleType.SHOPS, data.id);
          updateDoc(docRef, { ...data, coordinates: geoPoint });
          resolve(docRef.id);
        } else {
          const docRef = await addDoc(
            collection(this.fs, ModuleType.SHOPS),
            data
          );

          updateDoc(docRef, { coordinates: geoPoint });
          resolve(docRef.id);
        }
      } catch (error) {
        reject(error);
      }
    });
  }

  getShopById(id: string): Promise<IShop> {
    return new Promise(async (resolve, reject) => {
      try {
        const docRef = doc(this.fs, ModuleType.SHOPS, id);
        const docSync = await getDoc(docRef);
        const data = docSync.data() as DocumentData;

        const shop: IShop = {
          id: id,
          name: data['name'],
          logo: data['logo'],
          address1: data['address1'],
          address2: data['address2'],
          phone_number: data['phone_number'],
          openingHour: data['openingHour'],
          closingHour: data['closingHour'],
        };

        resolve(shop);
      } catch (error) {
        console.error('Error fetching shop:', error);
        reject(new Error(`Failed to fetch shop: ${error}`));
      }
    });
  }

  async getCategoryByID(id: string) {
    return new Promise(async (res, rej) => {
      const docRef = doc(this.fs, ModuleType.CATEGORY, id);
      const docSnap = await getDoc(docRef);

      res(docSnap.data());
    });
  }

  test() {
    return new Promise(async (res, rejs) => {
      const cakes: any = [];

      try {
        const itemCollection = collection(this.fs, ModuleType.CAKES);

        const docsList = (await getDocs(itemCollection)).docs;
        let i = 1;
        docsList.map(async (row) => {
          const cat_id = row.data()['category_id'];
          const category = await this.getCategoryByID(cat_id);
          console.log(category);
          console.log(i);
          // console.log(row.data());
          cakes.push({
            i: i,
            item: row.data(),
            category: category,
          });

          i++;
        });

        res(cakes);
      } catch (error) {
        console.log(error);
      } finally {
        rejs(cakes);
      }
    });
  }
  getFormErrors(form: AbstractControl) {
    if (form instanceof FormControl) {
      // Return FormControl errors or null
      return form.errors ?? null;
    }
    if (form instanceof FormGroup) {
      const groupErrors = form.errors;
      // Form group can contain errors itself, in that case add'em
      const formErrors = groupErrors ? { groupErrors } : {};
      Object.keys(form.controls).forEach((key) => {
        // Recursive call of the FormGroup fields
        // @ts-expect-error
        const error = this.getFormErrors(form.get(key));
        if (error !== null) {
          // Only add error if not null
          // @ts-expect-error
          formErrors[key] = error;
        }
      });
      // Return FormGroup errors or null
      return Object.keys(formErrors).length > 0 ? formErrors : null;
    }
  }
  async featureItem(id: string, checked: boolean) {
    const itemRef = doc(this.fs, ModuleType.CAKES, id);

    const update = await updateDoc(itemRef, {
      featured: checked,
    });
    console.log(update);

    // .doc(doc.id).update({ foo: 'bar' });
  }
  async deleteItem(id: string) {
    const itemRef = doc(this.fs, ModuleType.CAKES, id);

    const d = await deleteDoc(itemRef);
    console.log(d);
  }

  //! --------------------------- FLAVOURSE ------------------------------
  // TODO: GET FLAVOURS
  async getFlavours(): Promise<IFlavour[]> {
    return new Promise<IFlavour[]>((resolve, reject) => {
      const flavours: IFlavour[] = [];
      const itemCollection = collection(this.fs, ModuleType.FLAVOURS);

      getDocs(itemCollection)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            const data = doc.data() as DocumentData;
            const flavour: IFlavour = {
              id: doc.id,
              name: data['name'],
              photo: data['photo'],
              featured: data['featured'] ?? false,
            };
            flavours.push(flavour);
          });
          resolve(flavours);
        })
        .catch((error) => {
          console.error('Error fetching flavours:', error);
          reject(error);
        });
    });
  }

  // TODO: SAVE FLAVOUR
  async saveFlavourItem(data: IFlavour) {
    console.log(data);
    return new Promise(async (resolve, reject) => {
      try {
        const docRef = await addDoc(
          collection(this.fs, ModuleType.FLAVOURS),
          data
        );
        resolve(docRef.id);
      } catch (error) {
        reject(error);
      }
    });
  }

  // TODO: FEATURE FLAVOUR
  async featureFlavourItem(id: string, checked: boolean) {
    const itemRef = doc(this.fs, ModuleType.FLAVOURS, id);

    const update = await updateDoc(itemRef, {
      featured: checked,
    });
    console.log(update);
  }

  // TODO: DELETE FLAVOUR
  async deleteFlavourItem(id: string) {
    const itemRef = doc(this.fs, ModuleType.FLAVOURS, id);

    const d = await deleteDoc(itemRef);
    console.log(d);
  }
  //! --------------------------- END ------------------------------

  //! --------------------------- SLIDES ------------------------------
  // TODO: GET SLIDES
  async getSlides(): Promise<ISlide[]> {
    return new Promise<ISlide[]>((resolve, reject) => {
      const flavours: ISlide[] = [];
      const itemCollection = collection(this.fs, ModuleType.SLIDES);

      getDocs(itemCollection)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            const data = doc.data() as DocumentData;
            const flavour: ISlide = {
              id: doc.id,
              name: data['name'],
              photo: data['photo'],
              featured: data['featured'] ?? false,
            };
            flavours.push(flavour);
          });
          resolve(flavours);
        })
        .catch((error) => {
          console.error('Error fetching slides:', error);
          reject(error);
        });
    });
  }

  // TODO: SAVE SLIDE
  async saveSlideItem(data: ISlide) {
    console.log(data);
    return new Promise(async (resolve, reject) => {
      try {
        const docRef = await addDoc(
          collection(this.fs, ModuleType.SLIDES),
          data
        );
        resolve(docRef.id);
      } catch (error) {
        reject(error);
      }
    });
  }

  // TODO: FEATURE SLIDE
  async featureSlideItem(id: string, checked: boolean) {
    const itemRef = doc(this.fs, ModuleType.SLIDES, id);

    const update = await updateDoc(itemRef, {
      featured: checked,
    });
    console.log(update);
  }

  // TODO: DELETE SLIDE
  async deleteSlideItem(id: string) {
    const itemRef = doc(this.fs, ModuleType.SLIDES, id);

    const d = await deleteDoc(itemRef);
    console.log(d);
  }
  //! --------------------------- END ------------------------------

  //! --------------------------- USERS ------------------------------
  // TODO: GET USERS
  async getUsers(): Promise<IUser[]> {
    return new Promise<ISlide[]>((resolve, reject) => {
      const flavours: ISlide[] = [];
      const itemCollection = collection(this.fs, ModuleType.USERS);

      getDocs(itemCollection)
        .then((snapshot) => {
          snapshot.docs.forEach((doc) => {
            const data = doc.data() as DocumentData;
            const flavour: IUser = {
              id: doc.id,
              name: data['name'],
              uid: data['uid'],
              email: data['email'],
            };

            flavours.push(flavour);
          });
          resolve(flavours);
        })
        .catch((error) => {
          console.error('Error fetching slides:', error);
          reject(error);
        });
    });
  }

  // TODO: DELETE USER
  async deleteUser(userId: string): Promise<void> {
    const batch = writeBatch(this.fs);

    try {
      // Reference to the user document
      const userRef = doc(this.fs, ModuleType.USERS, userId);
      batch.delete(userRef);

      // Query for shops associated with the user
      const shopsCollection = collection(this.fs, ModuleType.SHOPS);
      const shopsQuery = query(shopsCollection, where('user_id', '==', userId));
      const shopsSnapshot = await getDocs(shopsQuery);

      for (const shopDoc of shopsSnapshot.docs) {
        // Add delete operation for each shop document
        batch.delete(shopDoc.ref);

        // Query for cakes associated with the shop
        const cakesCollection = collection(this.fs, ModuleType.CAKES);
        const cakesQuery = query(
          cakesCollection,
          where('shop_id', '==', shopDoc.id)
        );
        const cakesSnapshot = await getDocs(cakesQuery);

        // Add delete operations for each cake document
        cakesSnapshot.docs.forEach((cakeDoc) => {
          batch.delete(cakeDoc.ref);
        });
      }

      // Commit the batch
      await batch.commit();
      console.log(
        `User ${userId}, related shops, and their cakes successfully deleted.`
      );
    } catch (error) {
      console.error(
        `Error deleting user ${userId}, related shops, and their cakes:`,
        error
      );
      throw new Error('Failed to delete user, related shops, and their cakes');
    }
  }

  async getOrdersList() {
    var items: DocumentData[] = [];
    var waits: Array<Promise<any>> = [];

    const itemCollection = collection(this.fs, ModuleType.ORDERS);
    await getDocs(itemCollection).then((snapshot) => {
      snapshot.docs.forEach(async (doc) => {
        var data = doc.data();
        data['id'] = doc.id;
        const user = await this.getUserById(data['user_id']);
        data['user'] = user;
        items.push(data);
        return data;
      });
    });

    return items;
  }

  async getOrdersById(orderId: string) {
    var items: DocumentData[] = [];

    const docRef = doc(this.fs, ModuleType.ORDERS, orderId);

    const docSnap = await getDoc(docRef);

    if (docSnap.exists()) {
      var data = docSnap.data();
      const user = await this.getUserById(data['user_id']);
      data['user'] = user;
      return data;
    } else {
      // docSnap.data() will be undefined in this case
      return {};
    }
  }

  async updateOrderStatus(orderId: string) {
    const data = {
      completed: true,
    };
    const docRef = doc(this.fs, ModuleType.ORDERS, orderId);
    await updateDoc(docRef, { ...data });
    return true;
  }

  async getUserById(user_id: string) {
    const docRef = doc(this.fs, 'users', user_id);
    const docSnap = await getDoc(docRef);

    if (docSnap.exists()) {
      return docSnap.data();
    } else {
      // docSnap.data() will be undefined in this case
      return {};
    }
  }

  //! --------------------------- END ------------------------------
}
